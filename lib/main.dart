import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'core/di/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final providers = await Providers.getProviders();

  runApp(MultiProvider(providers: providers, child: const NewsNowApp()));
}
