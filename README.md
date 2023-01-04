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
    closeOnComplete: false // Default value True. if True close the BambaraView widget automatically after calling onSuccess or onError 
  ).show(context);
},
  ...
```
### OnSuccess Response
```dart
{slug: 5befed32-3784-4992-96b6-ffa3b088751b, status: success, fees: 4, amount: 200, currency: xof, wallet_reference: null, reference: 1E6oqPJ4Wn61mzOYXzAoBaQLdhl15V, customer: {name: Bassirou, email: bass@gmail.com, phone: 786338816}, link: https://bambara.coinhub.africa/payments/5befed32-3784-4992-96b6-ffa3b088751b, webhook: {ipn: null, success_url: , cancel_url: , failure_url: , home_url: https://forge.laravel.com}, products: [], extras: {wallet_url: }}
```
### OnError Response
```dart
{message: OK, statusCode: 200, data: {transaction: {slug: fe8d1971-6238-47de-8a05-16fa502445dd, status: failed, fees: 6, amount: 300, currency: xof, wallet_reference: null, reference: f1Z3zIb2zlZoiccZt6tkmwg6c2iivM, customer: {name: Bassirou, email: bass@gmail.com, phone: 786338816}, link: https://bambara.coinhub.africa/payments/fe8d1971-6238-47de-8a05-16fa502445dd, webhook: {ipn: null, success_url: , cancel_url: , failure_url: , home_url: https://forge.laravel.com}, products: [], extras: {wallet_url: null}}}}
```