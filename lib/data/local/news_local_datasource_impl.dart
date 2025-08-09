import 'package:khatibalamyfluttertask/core/prefs/shared_preference_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'news_local_datasource.dart';

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final SharedPreferences prefs;
  static const String _key = 'last_query';

  NewsLocalDataSourceImpl({required this.prefs});

  @override
  Future<void> cacheLastQuery(String query) async {
    await prefs.setString(_key, query);
  }

  @override
  Future<String?> getLastQuery() async {
    return prefs.getString(_key);
  }
}
