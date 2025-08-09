

import 'package:khatibalamyfluttertask/core/utils/pair.dart';

Pair<String,String> dateAndTimeFormatter(String date) {
  //"2025-08-07T05:01:39Z"
  final datePart = date.split('T').first.replaceAll('-', '/');
  final timePart = date.split('T').last.split('Z').first;
  return Pair(datePart, timePart);
}