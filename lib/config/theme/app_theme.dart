import 'package:flutter/material.dart';
import 'package:todo_list/common/ui/tokens/typography.dart';

ThemeData theme() {
  return ThemeData(
    primarySwatch: Colors.indigo,
    useMaterial3: true,
    fontFamily: TypographyToken.fontFamilySans,
  );
}
