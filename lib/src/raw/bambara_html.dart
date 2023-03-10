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
  <link rel="stylesheet" href="https://bambara.coinhub.africa/css/bambara.min.css">
  <script src="https://bambara.coinhub.africa/js/bambara.js" type="text/javascript"></script>
  <style> body { image-rendering: pixelated; } </style>
</head>

<body onload="setupBambaraCheckout()" style="border-radius: 20px; background-color:#fff;height:100vh;overflow: hidden;">
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
          reference: '${bambaraData.reference}',
          customer: {
            phone: "${bambaraData.phone}",
            name: "${bambaraData.name}",
            email: "${bambaraData.email}",
          },
          products: [],
          publicKey: "${bambaraData.publicKey}",
          onError: (data) => sendMessage({
            "type": "$onError",
            "data": { ...data },
          }),
          onSuccess: (data) => sendMessage({
            "type": "$onSuccess",
            "data": { ...data },
          }),
          onClose: () => sendMessage({
            "type": "$onClose",
          }),
          onRedirect: (data) => sendMessage({
            "type": "$onRedirect",
            "data": { ...data },
          }),
           onProcessing: (data) => sendMessage({
            "type": "$onProcessing",
            "data": { ...data },
          }),
        });
      }
    </script>
</body>

</html>
''', mimeType: 'text/html');
}
