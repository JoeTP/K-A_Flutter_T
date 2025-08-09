import 'package:shared_preferences/shared_preferences.dart';

abstract class NewsLocalDataSource {
  Future<void> cacheLastQuery(String query);
  Future<String?> getLastQuery();
}

