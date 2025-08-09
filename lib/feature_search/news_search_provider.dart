import 'dart:ffi';

import 'package:flutter/material.dart';

import '../core/utils/debouncer.dart';
import '../domain/model/news_article.dart';
import '../domain/usecase/cache_query_usecase.dart';
import '../domain/usecase/get_cached_query_usecase.dart';
import '../domain/usecase/search_news_usecase.dart';

class NewsProvider extends ChangeNotifier {
  final SearchNewsUseCase searchNewsUseCase;
  final GetCachedQueryUseCase getCachedQueryUseCase;
  final CacheQueryUseCase cacheQuery;
  final Debouncer debouncer = Debouncer(milliseconds: 500);

  List<NewsArticle> articles = [];
  bool isLoading = false;
  String errorMessage = '';
  String lastQuery = '';

  NewsProvider({
    required this.searchNewsUseCase,
    required this.getCachedQueryUseCase,
    required this.cacheQuery,
  }) {
    _loadLastQuery();
  }

  Future<void> _loadLastQuery() async {
    final query = await getCachedQueryUseCase(null);
    if (query != null && query.isNotEmpty) {
      lastQuery = query;
      searchNews(query, save: false);
    }
  }

  void searchNews(String query, {bool save = true}) {
    debouncer.run(() async {
      if (query.isEmpty) return;
      isLoading = true;
      errorMessage = '';
      notifyListeners();

      try {
        articles = await searchNewsUseCase(query);
        lastQuery = query;
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
