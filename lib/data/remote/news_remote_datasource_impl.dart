import 'package:dio/dio.dart';

import '../model/news_article_model.dart';
import 'news_remote_datasource.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio;
  final String apiKey;

  NewsRemoteDataSourceImpl({required this.dio, required this.apiKey});

  @override
  Future<List<NewsArticleModel>> getNewsByQuery(String query) async {
    try {
      final response = await dio.get(
        '/v2/everything',
        queryParameters: {'q': query, 'apiKey': apiKey},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        return (data['articles'] as List)
            .map((json) => NewsArticleModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to fetch news');
      }
    } on DioException catch (e) {
      throw Exception(
        e.response?.data?['message'] ?? e.message ?? 'Unknown error',
      );
    }
  }
}
