import 'package:flutter/material.dart';
import 'package:khatibalamyfluttertask/core/layout/main_layout.dart';
import 'package:khatibalamyfluttertask/core/di/providers.dart';
import 'package:provider/provider.dart';

import 'AppRoutes.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.root:
        return MaterialPageRoute(
          builder:
              (_) => MainLayout(),
        );
        case AppRoutes.search:
        return MaterialPageRoute(
          builder:
              (_) => MultiProvider(
                providers: Providers.providers,
                child: MainLayout(),
              ),
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
