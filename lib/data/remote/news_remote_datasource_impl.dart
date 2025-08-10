import 'package:dio/dio.dart';
import 'package:khatibalamyfluttertask/core/constants/app_strings.dart';

import '../model/news_article_model.dart';
import 'news_remote_datasource.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio;
  final String apiKey;

  NewsRemoteDataSourceImpl({required this.dio, required this.apiKey});

  @override
  Future<NewsArticleResponse> getNewsByQuery(String query) async {
    Map<String, String> queryParameters = {
      AppStrings.QUERY_KEY: query,
      AppStrings.API_KEY_KEY: apiKey,
      AppStrings.SEARCH_IN_KEY: "title",
    };

    try {
      final response = await dio.get(
        AppStrings.EVERYTHING_EP,
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        return NewsArticleResponse.fromJson(data);
      } else {
        throw Exception('Failed to fetch news');
      }
    } on DioException catch (e) {
      throw Exception(
        e.response?.data?['message'] ?? e.message ?? 'Unknown error',
      );
    }
  }

  @override
  Future<List<NewsArticleModel>> getHeadline() async {
    Map<String, String> queryParameters = {
      AppStrings.COUNTRY_KEY: "us",
      AppStrings.API_KEY_KEY: apiKey,
    };

    try {
      final response = await dio.get(
        AppStrings.HEADLINE_EP,
        queryParameters: queryParameters,
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
