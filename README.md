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
### OnSuccess Response
```json
{
    "slug": "79c31e45-8342-4b35-a2e3-6794f2e248f9",
    "status": "success",
    "fees": 4,
    "amount": 200,
    "currency": "xof",
    "wallet_reference": null,
    "reference": "e2lzwa6eelm",
    "customer": {
        "name": "Amadou Sall",
        "email": "sall@amadou.com",
        "phone": "776780987"
    },
    "link": "https://bambara.coinhub.africa/payments/79c31e45-8342-4b35-a2e3-6794f2e248f9",
    "webhook": {
        "ipn": null,
        "success_url": "",
        "cancel_url": "",
        "failure_url": "",
        "home_url": "https://app.magmasend.com/"
    },
    "products": [

    ],
    "extras": {
        "wallet_url": "https://pay.wave.com/c/cos-1c3yrfn9011g6?a=200&c=XOF&m=Kopar%20Express"
    }
}
```
### OnSuccess Response