import 'package:equatable/equatable.dart';

class BambaraData with EquatableMixin {
  final int amount;
  final String reference;
  final String phone;
  final String email;
  final String name;
  final String publicKey;
  final String? provider;

  BambaraData({
    required this.amount,
    required this.reference,
    required this.phone,
    required this.email,
    required this.name,
    required this.publicKey,
    this.provider,
  });

  @override
  List<Object?> get props => [amount, phone, reference, publicKey];
}
