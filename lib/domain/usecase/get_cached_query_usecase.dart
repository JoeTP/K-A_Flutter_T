import 'dart:ffi';

import 'package:khatibalamyfluttertask/domain/usecase/usecase.dart';

import '../repository/news_repository.dart';

class GetCachedQueryUseCase implements UseCase<void, String?> {
  final NewsRepository repository;

  GetCachedQueryUseCase(this.repository);

  @override
  Future<String?> call(void params) {
    return repository.getLastQuery();
  }
}
