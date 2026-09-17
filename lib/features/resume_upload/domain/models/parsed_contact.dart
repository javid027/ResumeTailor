import 'package:freezed_annotation/freezed_annotation.dart';

part 'parsed_contact.freezed.dart';
part 'parsed_contact.g.dart';

@freezed
sealed class ParsedContact with _$ParsedContact {
  const factory ParsedContact({
    String? name,
    String? email,
    String? phone,
    String? location,
  }) = _ParsedContact;

  factory ParsedContact.fromJson(Map<String, dynamic> json) => _$ParsedContactFromJson(json);
}
