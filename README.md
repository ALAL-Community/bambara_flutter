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
Making it super easy to accept Orange Money and Wave Payment in your App.

<img src="./example/example.gif" width="200">

## Installation

Add the package to your pubspec.yml file

```dart
  bambara_flutter: ^0.0.1
```

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
    onProcessing: (data) => print("Processing HERE"),
    onRedirect: (data) => print("REDIRECT HERE"),
    closeOnComplete: false // Default value True. if True close the BambaraView widget automatically after calling onSuccess or onError
  ).show(context);
},
  ...
```

### OnSuccess Response

```dart
{
  slug: 5befed32-3784-4992-96b6-ffa3b088751b,
  status: success,
  fees: 4,
  amount: 200,
  currency: xof,
  wallet_reference: null,
  reference: 1E6oqPJ4Wn61mzOYXzAoBaQLdhl15V,
  customer: {
    name: Bassirou,
    email: bass@gmail.com,
    phone: 786338816
  },
  link: https://bambara.coinhub.africa/payments/5befed32-3784-4992-96b6-ffa3b088751b,
  webhook: {
    ipn: null,
    success_url: https://example.com/success,
    cancel_url: https://example.com/cancel,
    failure_url: https://example.com/failure ,
    home_url: https://example.com},
    products: [],
    extras: {wallet_url: }
  }
}
```

### OnError Response

```dart
{
  slug: 5befed32-3784-4992-96b6-ffa3b088751b,
  status: failed,
  fees: 4,
  amount: 200,
  currency: xof,
  wallet_reference: null,
  reference: 1E6oqPJ4Wn61mzOYXzAoBaQLdhl15V,
  customer: {
    name: Bassirou,
    email: bass@gmail.com,
    phone: 786338816
  },
  link: https://bambara.coinhub.africa/payments/5befed32-3784-4992-96b6-ffa3b088751b,
  webhook: {
    ipn: null,
    success_url: https://example.com/success,
    cancel_url: https://example.com/cancel,
    failure_url: https://example.com/failure ,
    home_url: https://example.com},
    products: [],
    extras: {wallet_url: }
  }
}
```
