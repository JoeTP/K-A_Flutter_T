import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khatibalamyfluttertask/core/config/theme/app_theme.dart';
import 'package:khatibalamyfluttertask/app/route/RouteGenerator.dart';

import '../core/layout/main_layout.dart';

class NewsNowApp extends StatelessWidget {
  const NewsNowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) =>  MaterialApp(
      // child:  MaterialApp(
        title: 'News Now',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}