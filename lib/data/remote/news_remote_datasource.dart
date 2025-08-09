import 'package:dio/dio.dart';

import '../model/news_article_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsArticleModel>> getNewsByQuery(String query);
}
