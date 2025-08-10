class NewsArticle {
  final String title;
  final String description;
  final String? urlToImage;
  final String url;
  final String publishedAt;
  final String sourceName;

  NewsArticle({
    required this.title,
    required this.description,
    this.urlToImage,
    required this.url,
    required this.publishedAt,
    required this.sourceName,
  });
}