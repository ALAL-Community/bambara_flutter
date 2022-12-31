import 'package:equatable/equatable.dart';

class BambaraData with EquatableMixin {
  final int amount;
  final String paymentReference;
  final String customerPhone;
  final String publicKey;

  BambaraData({
    required this.amount,
    required this.paymentReference,
    required this.customerPhone,
    required this.publicKey,
  });

  @override
  List<Object?> get props =>
      [amount, customerPhone, paymentReference, publicKey];
}
