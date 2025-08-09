import 'package:flutter/material.dart';
import 'package:khatibalamyfluttertask/core/config/theme/app_theme.dart';
import 'package:khatibalamyfluttertask/app/route/RouteGenerator.dart';

import '../core/layout/main_layout.dart';

class NewsNowApp extends StatelessWidget {
  const NewsNowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Now',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}