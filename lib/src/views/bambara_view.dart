import 'dart:io';

import 'package:bambara_flutter/bambara_flutter.dart';
import 'package:bambara_flutter/src/const/const.dart';
import 'package:bambara_flutter/src/models/bambara_event_model.dart';
import 'package:bambara_flutter/src/raw/bambara_html.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BambaraView extends StatefulWidget {
  final BambaraData data;

  bool closeOnComplete;

  /// Success callback
  final ValueChanged<dynamic>? onSuccess;

  /// Error callback<
  final ValueChanged<dynamic>? onError;

  /// Redirect callback<
  final ValueChanged<dynamic>? onRedirect;

  /// Redirect callback<
  final ValueChanged<dynamic>? onProcessing;

  /// LazerPay popup Close callback
  final VoidCallback? onClosed;

  BambaraView(
      {Key? key,
      required this.data,
      this.onSuccess,
      this.onError,
      this.onClosed,
      this.onRedirect,
      this.onProcessing,
      this.closeOnComplete = true})
      : super(key: key);

  Future show(BuildContext context) => showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: true,
        isDismissible: false,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        builder: (context) => SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            height: MediaQuery.of(context).size.height * 0.6,
            child: BambaraView(
              data: data,
              onSuccess: onSuccess,
              onError: onError,
              onClosed: onClosed,
              onRedirect: onRedirect,
              onProcessing: onProcessing,
            ),
          ),
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
      case onSuccess:
        await closeInAppWebView();
        widget.onSuccess!(event.data);
        if (widget.closeOnComplete == true) {
          sleep(const Duration(seconds: 6));
          Navigator.pop(context);
        }
        return;
      case onRedirect:
        widget.onRedirect!(event.data);
        launchUrl(Uri.parse(event.data['url']),
            mode: event.data['wallet'] == 'bank-card'
                ? LaunchMode.inAppWebView
                : LaunchMode.externalApplication);
        return;
      case onError:
        await closeInAppWebView();
        widget.onError!(event.data);
        if (widget.closeOnComplete == true) {
          sleep(const Duration(seconds: 6));
          Navigator.pop(context);
        }
        return;
      case onProcessing:
        widget.onProcessing!(event.data);
        return;
      case onClose:
        widget.onClosed!();
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
      ..scrollTo(0, 100)
      ..addJavaScriptChannel('BambaraClientInterface',
          onMessageReceived: (JavaScriptMessage data) {
        _handleBambaraHtmlResponse(data.message);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: WebViewWidget(controller: _controller));
  }
}
