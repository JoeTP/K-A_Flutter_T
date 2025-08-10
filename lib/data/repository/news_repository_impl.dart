import 'package:khatibalamyfluttertask/data/model/news_article_model.dart';
import 'package:khatibalamyfluttertask/domain/model/news_article.dart';

import '../../domain/repository/news_repository.dart';
import '../local/news_local_datasource.dart';
import '../remote/news_remote_datasource.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;

  NewsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<NewsArticle>> getHeadline() async {
    return await remoteDataSource.getHeadline();
  }

  @override
  Future<NewsArticleResponse> searchNews(String query) async {
    await localDataSource.cacheLastQuery(query);
    return await remoteDataSource.getNewsByQuery(query);
  }

  @override
  Future<void> cacheLastQuery(String query) async {
    await localDataSource.cacheLastQuery(query);
  }

  @override
  Future<String?> getLastQuery() async {
    return await localDataSource.getLastQuery();
  }
}
