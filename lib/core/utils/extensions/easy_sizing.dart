

import 'package:flutter/cupertino.dart';

extension EasySizing on Widget {
  Widget size(double height, double width) => SizedBox(height: height, width: width, child: this);
}