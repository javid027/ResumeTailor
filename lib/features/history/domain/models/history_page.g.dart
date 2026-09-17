// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryPage _$HistoryPageFromJson(Map<String, dynamic> json) => _HistoryPage(
  items: (json['items'] as List<dynamic>)
      .map((e) => HistoryItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  page: (json['page'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$HistoryPageToJson(_HistoryPage instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
    };
