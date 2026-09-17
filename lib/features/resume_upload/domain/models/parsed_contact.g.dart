// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parsed_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParsedContact _$ParsedContactFromJson(Map<String, dynamic> json) =>
    _ParsedContact(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$ParsedContactToJson(_ParsedContact instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'location': instance.location,
    };
