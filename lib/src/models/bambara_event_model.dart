import 'dart:convert';

import 'package:equatable/equatable.dart';

class BambaraEventModel with EquatableMixin {
  final String type;
  final dynamic data;
  BambaraEventModel({
    required this.type,
    required this.data,
  });

  BambaraEventModel copyWith({
    String? type,
    dynamic data,
  }) {
    return BambaraEventModel(
      type: type ?? this.type,
      data: data ?? this.data,
    );
  }

  Map<String, Object> toMap() {
    return {
      'type': type,
      'data': data,
    };
  }

  factory BambaraEventModel.fromMap(Map<String, dynamic> map) {
    return BambaraEventModel(
      type: map['type'] as String,
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BambaraEventModel.fromJson(String source) =>
      BambaraEventModel.fromMap(
        json.decode(source),
      );

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [type, data ?? ''];
}
