import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:khatibalamyfluttertask/core/shared_component/default_snackbar.dart';
import 'package:khatibalamyfluttertask/core/shared_component/news_item_card.dart';
import 'package:khatibalamyfluttertask/core/utils/extensions/easy_sizing.dart';
import 'package:khatibalamyfluttertask/core/utils/extensions/padding.dart';
import 'package:khatibalamyfluttertask/core/utils/openInBrowser.dart';
import 'package:provider/provider.dart';

import '../../feature_search/news_search_provider.dart';
import '../constants/assets.dart';
import '../shared_component/search_field.dart';
import '../utils/date_and_time_formatter.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    final provider = context.read<NewsProvider>();
    _searchController = TextEditingController(text: provider.lastQuery);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NewsProvider>();


    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (provider.errorMessage.isNotEmpty) {
        defaultSnackBar(context, provider.errorMessage);
        provider.errorMessage = '';
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('News Now')),
      body: Column(
        children: [
          AppSearchField(
            controller: _searchController,
            hint:
                provider.lastQuery.isEmpty
                    ? 'Search News...'
                    : "last search keyword: ${provider.lastQuery}",
            onChanged: provider.searchNews,
          ).paddingSymmetric(horizontal: 12.r).paddingOnly(top: 12.h),
          Expanded(
            child: provider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : provider.isSearchMode && provider.articles.isEmpty
                ? Center(
              child: Image.asset(Assets.Nodata).size(200.h, 200.w),
            )
                : ListView.separated(
              padding: EdgeInsets.only(bottom: 12.h, top: 2.h),
              itemCount: provider.articles.length,
              itemBuilder: (context, index) {
                final article = provider.articles[index];
                final formattedDate =
                    dateAndTimeFormatter(article.publishedAt).first;

                return NewsItemCard(
                  imageUrl: article.urlToImage,
                  title: article.title,
                  description: article.description,
                  publishedAt: formattedDate,
                  sourceName: article.sourceName,
                  onClick: () async => openInBrowser(article.url),
                ).paddingSymmetric(horizontal: 12.w);
              },
              separatorBuilder: (_, __) => Gap(12.h),
            ),
          )
        ],
      ),
    );
  }
}
