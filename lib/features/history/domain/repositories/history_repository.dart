import '../models/history_page.dart';

abstract class HistoryRepository {
  Future<HistoryPage> getHistory({int page = 1, int limit = 20});
}
