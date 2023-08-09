import 'package:flutter/material.dart';
import 'package:todo_list/common/ui/tokens/typography.dart';

ThemeData theme() {
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.orange,
    useMaterial3: true,
    fontFamily: TypographyToken.fontFamilySans,
  );
}

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.orange,
    useMaterial3: true,
    fontFamily: TypographyToken.fontFamilySans,
  );
}