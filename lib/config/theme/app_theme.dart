import 'package:flutter/material.dart';
import 'package:todo_list/common/ui/tokens/typography.dart' as my_typography;

ThemeData theme() {
  return ThemeData(
    primarySwatch: Colors.indigo,
    useMaterial3: true,
    fontFamily: my_typography.Typography.fontFamilySans,
  );
}
