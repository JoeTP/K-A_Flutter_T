import 'package:flutter/material.dart';
import 'package:khatibalamyfluttertask/core/layout/main_layout.dart';
import 'package:khatibalamyfluttertask/core/di/providers.dart';
import 'package:khatibalamyfluttertask/feature_search/news_search_screen.dart';
import 'package:provider/provider.dart';

import 'AppRoutes.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.root:
        return MaterialPageRoute(
          builder:
              (_) => SafeArea(child: MainLayout()),
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('No Route Found'))),
        );
    }
  }
}
