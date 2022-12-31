<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

This package makes it easy to use the Bambara in a flutter project.

## Usage

```dart
import 'package:bambara_flutter/bambara_flutter.dart';

...
onPressed: () async {
  await BambaraView(
    data: BambaraData(
        amount: "1000",
        paymentReference: "21e5ysuiadjaksd",
        customerPhone: "778909878",
        publicKey: "dasfdghasjkduasdas"
    ),
    onClosed: () {
      print("CLOSED");
    },
    onError: (value) => print("ERROR HERE"),
    onSuccess: (value) => print("SUCCESS HERE"),
  ).show(context);
},
  ...
```
