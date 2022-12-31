import 'package:bambara_flutter/bambara_flutter.dart';
import 'package:bambara_flutter/src/const/const.dart';
import 'package:bambara_flutter/src/models/bambara_event_model.dart';
import 'package:bambara_flutter/src/raw/bambara_html.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BambaraView extends StatefulWidget {
  final BambaraData data;

  /// Success callback
  final ValueChanged<dynamic>? onSuccess;

  /// Error callback<
  final ValueChanged<dynamic>? onError;

  /// LazerPay popup Close callback
  final VoidCallback? onClosed;

  const BambaraView(
      {Key? key,
      required this.data,
      this.onSuccess,
      this.onError,
      this.onClosed})
      : super(key: key);

  Future show(BuildContext context) => showMaterialModalBottomSheet(
        expand: false,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        builder: (context) => BambaraView(
          data: data,
          onSuccess: onSuccess,
          onError: onError,
          onClosed: onClosed,
        ),
      );
  @override
  State<BambaraView> createState() => _BambaraViewState();
}

class _BambaraViewState extends State<BambaraView> {
  late WebViewController _controller;

  void _handleBambaraHtmlResponse(String res) async {
    final event = BambaraEventModel.fromJson(res);
    switch (event.type) {
      case ON_SUCCESS:
        Navigator.pop(context);
        print('succeded !');
        return;
      case ON_ERROR:
        Navigator.pop(context);
        print('error !');
        return;
      case ON_CLOSE:
        Navigator.pop(context);
        return;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(BambaraHtml.buildBambaraHtml(widget.data))
      ..enableZoom(false)
      ..addJavaScriptChannel('BambaraClientInterface',
          onMessageReceived: (JavaScriptMessage data) {
        _handleBambaraHtmlResponse(data.message);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: 400,
      child: WebViewWidget(controller: _controller),
    );
  }
}
