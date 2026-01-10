import 'package:flutter/material.dart';

extension WidgetSpacing on num {
  SizedBox get spacingW => SizedBox(width: toDouble());
  SizedBox get spacingH => SizedBox(height: toDouble());
}

SizedBox sizedBoxH(double size) {
  return SizedBox(height: size,);
}

SizedBox sizedBoxW(double size) {
  return SizedBox(width: size,);
}