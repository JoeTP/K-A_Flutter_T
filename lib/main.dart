import 'package:flutter/material.dart';
import 'package:khatibalamyfluttertask/core/constants/app_strings.dart';

import 'app/app.dart';

void main() {
  runApp(const NewsNowApp());
  print(String.fromEnvironment(AppStrings.apiKey));
}

