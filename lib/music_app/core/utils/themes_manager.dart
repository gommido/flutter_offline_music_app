import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';



ThemeData appTheme(){
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorManager.backgroundColor,
    appBarTheme:  AppBarTheme(
      backgroundColor: ColorManager.backgroundColor.withOpacity(0.9),
    ),
    textTheme: const TextTheme(
      bodySmall:  TextStyle(
        color: ColorManager.white,
        fontSize: FontManager.s10,
        fontFamily: 'ReadexPro',
      ),
      bodyMedium:  TextStyle(
        color: ColorManager.white,
        fontSize: FontManager.s14,
        fontFamily: 'ReadexPro',
      ),
      bodyLarge: TextStyle(
        color: ColorManager.white,
        fontSize: FontManager.s16,
        fontFamily: 'ReadexPro',
      ),
      displayLarge: TextStyle(
        color: ColorManager.white,
        fontSize: FontManager.s18,
        fontFamily: 'ReadexPro',
      ),
    ),
    iconTheme: const IconThemeData(
      color: ColorManager.white,
    ),
    sliderTheme: const SliderThemeData(
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 2.0),
      trackHeight: 1

    )
  ) ;
}