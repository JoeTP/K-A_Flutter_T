import 'package:khatibalamyfluttertask/domain/usecase/usecase.dart';

import '../repository/news_repository.dart';

class CacheQueryUseCase implements UseCase<String, void> {
  final NewsRepository repository;

  CacheQueryUseCase(this.repository);

  @override
  Future<void> call(String query) {
    return repository.cacheLastQuery(query);
  }
}
