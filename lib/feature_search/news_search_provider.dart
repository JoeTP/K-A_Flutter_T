import 'package:flutter/material.dart';
import 'package:khatibalamyfluttertask/domain/usecase/get_headlines_usecase.dart';
import '../core/utils/debouncer.dart';
import '../domain/model/news_article.dart';
import '../domain/usecase/cache_query_usecase.dart';
import '../domain/usecase/get_cached_query_usecase.dart';
import '../domain/usecase/search_news_usecase.dart';

class NewsProvider extends ChangeNotifier {
  final SearchNewsUseCase searchNewsUseCase;
  final GetCachedQueryUseCase getCachedQueryUseCase;
  final CacheQueryUseCase cacheQuery;
  final GetHeadlinesUseCase getHeadlinesUseCase;
  final Debouncer debouncer = Debouncer(milliseconds: 500);

  List<NewsArticle> articles = [];
  bool isLoading = false;
  String errorMessage = '';
  String lastQuery = '';
  bool isSearchMode = false;

  NewsProvider({
    required this.searchNewsUseCase,
    required this.getCachedQueryUseCase,
    required this.cacheQuery,
    required this.getHeadlinesUseCase,
  }) {
    _loadLastQuery();
  }

  Future<void> _loadLastQuery() async {
    final query = await getCachedQueryUseCase(null);
    if (query != null) {
      lastQuery = query;
      searchNews(query, save: false);
    } else {
      loadHeadlines();
    }
  }

  void loadHeadlines() async {
    isSearchMode = false;
    isLoading = true;
    notifyListeners();
    try {
      articles = await getHeadlinesUseCase(null);
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  void searchNews(String query, {bool save = true}) {
    debouncer.run(() async {
      if (query.isEmpty) {
        loadHeadlines();
        return;
      }
      isSearchMode = true;
      isLoading = true;
      errorMessage = '';
      notifyListeners();

      try {
        final response = await searchNewsUseCase(query);
        articles = response.articles;
        lastQuery = query;

        if(response.totalResults > 100){
          errorMessage = "cannot load more than 100 articles (free plan)";
        }

        if (save) {
          await cacheQuery(query);
        }
      } catch (e) {
        errorMessage = e.toString();
      }
      isLoading = false;
      notifyListeners();
    });
  }
}
