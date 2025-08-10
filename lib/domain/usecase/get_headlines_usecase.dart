
import 'package:khatibalamyfluttertask/domain/usecase/usecase.dart';

import '../model/news_article.dart';
import '../repository/news_repository.dart';

class GetHeadlinesUseCase extends UseCase<void, List<NewsArticle>> {
  final NewsRepository repository;

  GetHeadlinesUseCase(this.repository);

  @override
  Future<List<NewsArticle>> call(void params) {
    return repository.getHeadline();
  }
}