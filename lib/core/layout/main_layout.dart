import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khatibalamyfluttertask/app/route/AppRoutes.dart';
import 'package:khatibalamyfluttertask/core/config/color/app_colors.dart';
import 'package:khatibalamyfluttertask/core/shared_component/app_bar.dart';
import 'package:khatibalamyfluttertask/core/utils/extensions/padding.dart';

import '../shared_component/search_field.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true, // stays visible at top when collapsed
            floating: false, // true makes it appear when you scroll up a little
            snap: false, // only works if floating is true
            expandedHeight: kToolbarHeight + 50.h, // height when expanded
            backgroundColor: AppColors.white,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Column(
                children: [
                  Text("News Now"),
                  AppSearchField(hint: "Search News..."),
                ],
              ),
            ),


          ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text('Item ${index + 1}'),
          ),
          childCount: 30,
        ),
      )
        ],
      ),
    );
  }
}


