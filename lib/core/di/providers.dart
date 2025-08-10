import 'package:khatibalamyfluttertask/core/constants/app_strings.dart';
import 'package:khatibalamyfluttertask/domain/usecase/get_headlines_usecase.dart';
import 'package:khatibalamyfluttertask/domain/usecase/search_news_usecase.dart';
import 'package:khatibalamyfluttertask/feature_search/news_search_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/local/news_local_datasource.dart';
import '../../data/local/news_local_datasource_impl.dart';
import '../../data/remote/news_remote_datasource.dart';
import '../../data/remote/news_remote_datasource_impl.dart';
import '../../data/repository/news_repository_impl.dart';
import '../../domain/usecase/cache_query_usecase.dart';
import '../../domain/usecase/get_cached_query_usecase.dart';
import '../config/environment.dart';
import '../network/dio_client.dart';
import '../prefs/shared_preference_manager.dart';

abstract class Providers {
  static Future<List<SingleChildWidget>> getProviders() async {

    final sharedPrefs = await SharedPreferences.getInstance();

    return [

      /// Dio Client
      Provider<DioClient>(
        create: (_) => DioClient(baseUrl: AppStrings.baseUrl),
      ),

      /// Local Data Source
      Provider<NewsLocalDataSource>(
        create: (context) => NewsLocalDataSourceImpl(prefs: sharedPrefs),
      ),

      /// Remote Data Source
      Provider<NewsRemoteDataSource>(
        create:
            (context) => NewsRemoteDataSourceImpl(
              dio: context.read<DioClient>().dio,
              apiKey: Environment.apiKey,
            ),
      ),

      /// Repository
      Provider<NewsRepositoryImpl>(
        create:
            (context) => NewsRepositoryImpl(
              localDataSource: context.read<NewsLocalDataSource>(),
              remoteDataSource: context.read<NewsRemoteDataSource>(),
            ),
      ),

      /// Use Cases
      Provider<GetHeadlinesUseCase>(
        create:
            (context) => GetHeadlinesUseCase(context.read<NewsRepositoryImpl>()),
      ),
      Provider<SearchNewsUseCase>(
        create:
            (context) => SearchNewsUseCase(context.read<NewsRepositoryImpl>()),
      ),
      Provider<GetCachedQueryUseCase>(
        create:
            (context) =>
                GetCachedQueryUseCase(context.read<NewsRepositoryImpl>()),
      ),
      Provider<CacheQueryUseCase>(
        create:
            (context) => CacheQueryUseCase(context.read<NewsRepositoryImpl>()),
      ),

      /// Provider
      ChangeNotifierProvider<NewsProvider>(
        create:
            (context) => NewsProvider(
              searchNewsUseCase: context.read<SearchNewsUseCase>(),
              getCachedQueryUseCase: context.read<GetCachedQueryUseCase>(),
              cacheQuery: context.read<CacheQueryUseCase>(),
              getHeadlinesUseCase: context.read<GetHeadlinesUseCase>(),
            ),
      ),
    ];
  }
}
