import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget paddingAll(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Widget paddingOnly({
    double top = 0,
    double right = 0,
    double bottom = 0,
    double left = 0,
  }) =>
      Padding(
        padding: EdgeInsets.only(top: top, right: right, bottom: bottom, left: left),
        child: this,
      );

  Widget paddingSymmetric({
    double vertical = 0,
    double horizontal = 0,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );
}