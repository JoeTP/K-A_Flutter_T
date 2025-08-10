import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:khatibalamyfluttertask/core/shared_component/default_snackbar.dart';
import 'package:khatibalamyfluttertask/core/shared_component/news_item_card.dart';
import 'package:khatibalamyfluttertask/core/utils/extensions/easy_sizing.dart';
import 'package:khatibalamyfluttertask/core/utils/extensions/padding.dart';
import 'package:khatibalamyfluttertask/core/utils/openInBrowser.dart';
import 'package:provider/provider.dart';

import '../../feature_search/news_search_provider.dart';
import '../../feature_search/news_search_screen.dart';
import '../constants/assets.dart';
import '../shared_component/search_field.dart';
import '../utils/date_and_time_formatter.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text('News Now')),
      // since it is only 1 screen I will pass the body as search screen "usually list of screens for the BNB"
      body: SearchBody(),
    );
  }
}
