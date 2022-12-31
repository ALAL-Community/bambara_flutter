import 'package:bambara_flutter/bambara_flutter.dart';
import 'package:bambara_flutter/src/const/const.dart';

class BambaraHtml {
  static buildBambaraHtml(BambaraData bambaraData) => Uri.dataFromString('''
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bambara</title>
      <link rel="stylesheet" href="https://c2af214bb513.eu.ngrok.io/src/bambara.min.css">
    <script src="https://c2af214bb513.eu.ngrok.io/src/bambara.js" type="text/javascript"></script>
    <style> body { image-rendering: pixelated; } </style>
    
  <script src="https://cdn.tailwindcss.com"></script>
</head>

<body onload="setupBambaraCheckout()" style="border-radius: 20px; background-color:#fff;height:100vh;overflow: hidden; ">
    <script type="text/javascript">
      // Send callback to dart JSMessageClient
      function sendMessage(message) {
          if (window.BambaraClientInterface && window.BambaraClientInterface.postMessage) {
              sendMessageRaw(JSON.stringify(message));
          }
      }

      // Send raw callback to dart JSMessageClient
      function sendMessageRaw(message) {
          if (window.BambaraClientInterface && window.BambaraClientInterface.postMessage) {
              BambaraClientInterface.postMessage(message);
          }
      }

      function setupBambaraCheckout() {
        new Bambara({
          amount: "${bambaraData.amount}",
          reference: '${bambaraData.paymentReference}',
          phone: "${bambaraData.customerPhone}",
          onError: (data) => sendMessage({
            "type": "$ON_ERROR",
            "data": { ...data },
          }),
          onSuccess: (data) => sendMessage({
            "type": "$ON_SUCCESS",
            "data": { ...data },
          }),
          onClose: () => sendMessage({
            "type": "$ON_CLOSE",
          }),
        });
      }
    </script>
</body>

</html>
''', mimeType: 'text/html');
}
