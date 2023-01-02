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
        amount: 1000,
        reference: "21e5ysuiadjaksd",
        phone: "778909878",
        email: "bass@gmail.com",
        name: "Bassirou",
        publicKey: "pk_IuR83FabBsxW2P6mHPJywyGljga9QcFg",),
    onClosed: () => print("CLOSED"),
    onError: (data) => print(data),
    onSuccess: (data) => print("SUCCESS HERE"),
    onRedirect: (data) => print("REDIRECT HERE"),
  ).show(context);
},
  ...
```
