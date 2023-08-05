import 'package:todo_list/common.dart';

enum FontSizes { extraSmall, small, base, large, extraLarge }

enum Weights { thin, light, regular, medium, bold, black }

/*
  Typography based on Tailwind CSS:
  https://tailwindcss.com/docs/font-size
*/
class TypographyToken {
  static const String fontFamilySans = 'Roboto';

  static const Map<FontSizes, double> fontSizes = {
    FontSizes.extraSmall: 12.0,
    FontSizes.small: 14.0,
    FontSizes.base: 16.0,
    FontSizes.large: 18.0,
    FontSizes.extraLarge: 20.0,
  };

  static const Map<FontSizes, double> heights = {
    FontSizes.extraSmall: 16.0 / 12.0,
    FontSizes.small: 20.0 / 14.0,
    FontSizes.base: 24.0 / 16.0,
    FontSizes.large: 28.0 / 18.0,
    FontSizes.extraLarge: 28.0 / 20.0,
  };

  static const Map<Weights, FontWeight> weights = {
    Weights.thin: FontWeight.w100,
    Weights.light: FontWeight.w300,
    Weights.regular: FontWeight.w400,
    Weights.medium: FontWeight.w500,
    Weights.bold: FontWeight.w700,
    Weights.black: FontWeight.w900,
  };
}
