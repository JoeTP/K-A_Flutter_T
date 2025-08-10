
import '../../domain/model/news_article.dart';

class NewsArticleResponse {
  final List<NewsArticleModel> articles;
  final int totalResults;

  NewsArticleResponse({
    required this.articles,
    required this.totalResults,
  });

  factory NewsArticleResponse.fromJson(Map<String, dynamic> json) {
    return NewsArticleResponse(
      articles: (json['articles'] as List).map((articleJson) => NewsArticleModel.fromJson(articleJson)).toList(),
      totalResults: json['totalResults'] as int? ?? 0,
    );
  }
}

class NewsArticleModel extends NewsArticle {
  NewsArticleModel({
    required String title,
    required String description,
    String? urlToImage,
    required String url,
    required String publishedAt,
    required String sourceName,
  }) : super(
    title: title,
    description: description,
    urlToImage: urlToImage,
    url: url,
    publishedAt: publishedAt,
    sourceName: sourceName,
  );

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) {
    return NewsArticleModel(
      title: json['title'] as String? ?? 'No title',
      description: json['description'] as String? ?? 'No description',
      urlToImage: json['urlToImage'] as String?,
      url: json['url'] as String? ?? '',
      publishedAt: json['publishedAt'] ,
      sourceName: (json['source'] as Map<String, dynamic>?)?['name'] as String? ?? 'Unknown source',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'urlToImage': urlToImage,
      'url': url,
      'publishedAt': publishedAt,
      'source': {'name': sourceName},
    };
  }
}