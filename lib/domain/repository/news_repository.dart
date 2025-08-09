import 'package:khatibalamyfluttertask/domain/model/news_article.dart';

abstract class NewsRepository {
  Future<List<NewsArticle>> getHeadline();

  Future<List<NewsArticle>> searchNews(String query);

  Future<void> cacheLastQuery(String query);
  Future<String?> getLastQuery();

}
