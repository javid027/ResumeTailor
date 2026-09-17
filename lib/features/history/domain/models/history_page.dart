import 'package:freezed_annotation/freezed_annotation.dart';

import 'history_item.dart';

part 'history_page.freezed.dart';
part 'history_page.g.dart';

@freezed
sealed class HistoryPage with _$HistoryPage {
  const factory HistoryPage({
    required List<HistoryItem> items,
    required int page,
    required int limit,
    required int total,
  }) = _HistoryPage;

  factory HistoryPage.fromJson(Map<String, dynamic> json) => _$HistoryPageFromJson(json);
}
