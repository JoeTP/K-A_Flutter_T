import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:khatibalamyfluttertask/core/shared_component/news_item_card.dart';
import 'package:khatibalamyfluttertask/core/utils/extensions/padding.dart';
import 'package:khatibalamyfluttertask/core/utils/openInBrowser.dart';
import 'package:khatibalamyfluttertask/domain/model/news_article.dart';
import 'package:provider/provider.dart';

import '../../feature_search/news_search_provider.dart';
import '../shared_component/search_field.dart';
import '../utils/date_and_time_formatter.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('News Now')),
      body: Column(
        children: [
          AppSearchField(
            hint:
                provider.lastQuery == ""
                    ? 'Search News...'
                    : "Previous Search: ${provider.lastQuery}",
            onChanged: (value) => provider.searchNews(value),
          ).paddingAll(12.r),
          Expanded(
            child:
                provider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.separated(
                      itemCount: provider.articles.length,
                      itemBuilder: (context, index) {
                        NewsArticle article = provider.articles[index];
                        String? formattedDate = dateAndTimeFormatter(article.publishedAt).first;

                        return NewsItemCard(
                          imageUrl: article.urlToImage,
                          title: article.title,
                          description: article.description,
                          publishedAt: formattedDate,
                          sourceName: article.sourceName,
                          onClick: () async => openInBrowser(article.url),
                        ).paddingSymmetric(horizontal: 12.w);
                      },
                      separatorBuilder:
                          (BuildContext context, int index) => Gap(12.h),
                    ),
          ),
        ],
      ),
    );
  }
}
