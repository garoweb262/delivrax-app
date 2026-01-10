import 'package:flutter/material.dart';

extension ThemeContext on BuildContext {
  /// ThemeData shortcut
  ThemeData get theme => Theme.of(this);

  /// TextTheme shortcut
  TextTheme get text => Theme.of(this).textTheme;

  /// ColorScheme shortcut
  ColorScheme get colors => Theme.of(this).colorScheme;

  /// MediaQuery size shortcut
  Size get screenSize => MediaQuery.of(this).size;

  /// For checking brightness mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Padding shortcut
  EdgeInsets get screenPadding => MediaQuery.of(this).padding;
}