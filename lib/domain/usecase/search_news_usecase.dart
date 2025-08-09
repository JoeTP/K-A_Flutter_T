import 'package:khatibalamyfluttertask/domain/usecase/usecase.dart';

import '../model/news_article.dart';
import '../repository/news_repository.dart';

class SearchNewsUseCase implements UseCase<String, List<NewsArticle>> {
  final NewsRepository repository;

  SearchNewsUseCase(this.repository);

  @override
  Future<List<NewsArticle>> call(String query) {
    return repository.searchNews(query);
  }
}
