import 'package:khatibalamyfluttertask/data/model/source_dto.dart';

import '../../domain/model/news_article.dart';

// class NewsDto {
//   final String? title;
//   final String? description;
//   final String? publishedAt;
//   final SourceDto? source;
//   final String? urlToImage;
//   final String? url;
//
//   NewsDto({
//     this.title,
//     this.description,
//     this.publishedAt,
//     this.source,
//     this.urlToImage,
//     this.url,
//   });
// }


class NewsArticleModel extends NewsArticle {
  NewsArticleModel({
    required String title,
    required String description,
    required String urlToImage,
  }) : super(title: title, description: description, urlToImage: urlToImage);

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) {
    return NewsArticleModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
    );
  }
}
