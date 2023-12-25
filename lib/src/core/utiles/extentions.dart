import 'package:flutter/material.dart';

extension ImagePath on String {
  String get toPng => 'assets/images/$this.png';
  String get toSvg => 'assets/images/$this.svg';
  String get toJpg => 'assets/images/$this.jpg';
  String get toGif => 'assets/images/$this.gif';
}

extension Emptypadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}

extension ThemeShortCuts on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get topPading => MediaQuery.of(this).padding.top;
}
