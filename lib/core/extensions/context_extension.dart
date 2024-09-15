import 'package:kewsa/imports_bindings.dart';
import 'package:flutter/material.dart';

///* This extension methords reduces
extension BuildContextX on BuildContext {
  ///* to get screen height
  double get height => MediaQuery.sizeOf(this).height;

  ///* to get screen width
  double get width => MediaQuery.sizeOf(this).width;

  ///* For getting Themes
  ThemeData get theme => Theme.of(this);

  ///* For getting theme inverted color
  Color get color => theme.iconTheme.color!;

  ///*To move to new page
  void push(Route<void> route) {
    Navigator.push(this, route);
  }

  ///*Close current page
  void pop() => Navigator.pop(this);

  ///*Replace current page
  void pushReplacement(Route<void> route) {
    Navigator.pushReplacement(this, route);
  }

  ///*Remove all screens and Move to new page
  void pushAndRemoveUntil(Route<void> route) {
    Navigator.pushAndRemoveUntil(this, route, (route) => false);
  }
}
