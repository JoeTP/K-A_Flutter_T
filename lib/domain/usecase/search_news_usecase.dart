import 'package:khatibalamyfluttertask/domain/usecase/usecase.dart';

import '../../data/model/news_article_model.dart';
import '../model/news_article.dart';
import '../repository/news_repository.dart';

class SearchNewsUseCase implements UseCase<String,   NewsArticleResponse> {
  final NewsRepository repository;

  SearchNewsUseCase(this.repository);

  @override
  Future<NewsArticleResponse> call(String query) {
    return repository.searchNews(query);
  }
}
