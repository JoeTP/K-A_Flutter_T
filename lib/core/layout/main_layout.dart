import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khatibalamyfluttertask/app/route/AppRoutes.dart';
import 'package:khatibalamyfluttertask/core/config/color/app_colors.dart';
import 'package:khatibalamyfluttertask/core/shared_component/app_bar.dart';
import 'package:khatibalamyfluttertask/core/shared_component/news_item_card.dart';
import 'package:khatibalamyfluttertask/core/utils/extensions/padding.dart';
import 'package:khatibalamyfluttertask/domain/model/news_article.dart';
import 'package:provider/provider.dart';

import '../../feature_search/news_search_provider.dart';
import '../shared_component/search_field.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsProvider>(context);


    return Scaffold(
      appBar: AppBar(title: const Text('News Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search News...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => provider.searchNews(value),
            ),
          ),
          Expanded(
            child: provider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: provider.articles.length,
              itemBuilder: (context, index) {
                NewsArticle article = provider.articles[index];
                return NewsItemCard(
                  imageUrl: article.urlToImage,
                  title: article.title,
                 description: article.description,
                onClick: (){},
                publishedAt: "123",
                sourceName: "BBC",);
              },
            ),
          ),
        ],
      ),
    );
  }
}


