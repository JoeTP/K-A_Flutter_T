import 'package:khatibalamyfluttertask/domain/model/news_article.dart';

import '../../data/model/news_article_model.dart';

abstract class NewsRepository {
  Future<List<NewsArticle>> getHeadline();

  Future<NewsArticleResponse> searchNews(String query);

  Future<void> cacheLastQuery(String query);
  Future<String?> getLastQuery();

}
