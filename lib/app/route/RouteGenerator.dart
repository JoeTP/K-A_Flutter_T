import 'package:flutter/material.dart';
import 'package:khatibalamyfluttertask/core/layout/main_layout.dart';

import 'AppRoutes.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.root:
        return MaterialPageRoute(
          builder: (_) => const SafeArea(child: MainLayout()),
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
