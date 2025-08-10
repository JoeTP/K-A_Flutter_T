import 'package:flutter/material.dart';

extension Clipping on Widget {
  Widget clipRRect(double radius) =>
      ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);

  Widget clipOnly({
    double topRight = 0,
    double topLeft = 0,
    double bottomRight = 0,
    double bottomLeft = 0,
  }) => ClipRRect(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(topRight),
      topLeft: Radius.circular(topLeft),
      bottomRight: Radius.circular(bottomRight),
      bottomLeft: Radius.circular(bottomLeft),
    ),
    child: this,
  );
}
