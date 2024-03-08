import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sunnah_songi/app/config/quran_color.dart';
import 'package:sunnah_songi/app/config/sunnah_screen.dart';
import 'package:sunnah_songi/app/static/constants.dart';
import 'package:sunnah_songi/app/static/font_family.dart';
import 'package:sunnah_songi/app/sunnah_songi.dart';

class SunnahTheme {
  SunnahTheme._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: FontFamily.kalpurush,
    checkboxTheme: CheckboxThemeData(
      side: BorderSide(
        color: QuranColor.primaryColorLight.withOpacity(0.3),
        width: 2,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.5)),
    ),
    bannerTheme:
        const MaterialBannerThemeData(backgroundColor: Color(0xffDBDBDB)),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xffDEDEDE)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xff17B686)),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xff17B686)),
      ),
      focusColor: QuranColor.primaryColorLight,
      labelStyle: TextStyle(color: Color(0xff17B686)),
      hoverColor: Color(0xff17B686),
      fillColor: Colors.white,
    ),
    dividerTheme: DividerThemeData(
      color: const Color(0xff614730).withOpacity(0.9),
      thickness: 1,
      space: 0,
    ),
    radioTheme: RadioThemeData(
      visualDensity: const VisualDensity(horizontal: -4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      overlayColor: MaterialStateProperty.all(QuranColor.cardColorLight),
      fillColor: MaterialStateProperty.all(QuranColor.primaryColorLight),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: QuranColor.primaryColorLight,
      selectionColor: QuranColor.primaryColorLight.withOpacity(0.2),
      selectionHandleColor: QuranColor.primaryColorLight,
    ),
    disabledColor: const Color(0xff7F909F),
    dividerColor: const Color(0xffDEDEDE),
    primaryColorLight: Colors.black,
    secondaryHeaderColor: const Color(0xff17B686),
    //   iconButtonTheme: IconButtonThemeData(
    //     style: ButtonStyle(
    //  iconColor: MaterialStateProperty<>
    //     ),
    //   ),
    buttonTheme: const ButtonThemeData(
      buttonColor: QuranColor.textColorLight,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        // backgroundColor: Colors.red,
        ),
    cardColor: QuranColor.cardColorLight,
    iconTheme: const IconThemeData(color: QuranColor.textColorLight),
    primaryColor: QuranColor.primaryColorLight,
    scaffoldBackgroundColor: QuranColor.scaffoldBachgroundColorLight,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      modalBackgroundColor: Color(0xFFF3F3F3),
    ),
    scrollbarTheme: const ScrollbarThemeData(),
    appBarTheme: const AppBarTheme(
      shadowColor: Colors.white,
      backgroundColor: QuranColor.secondaryColorLight,
      foregroundColor: Color(0xff477848),
      elevation: 0,
      scrolledUnderElevation: 0,

      // color: Color(0xff17B686),
      iconTheme: IconThemeData(color: QuranColor.textColorLight),
    ),
    textTheme: TextTheme(
        displayLarge: const TextStyle(color: QuranColor.primaryColorLight),
        displayMedium: const TextStyle(color: Color(0xFF3B3B3B)),
        bodySmall: TextStyle(
          color: QuranColor.textColorLight.withOpacity(0.6),
          fontFamily: FontFamily.kalpurush,
          fontWeight: FontWeight.w400,
        ),
        titleMedium: const TextStyle(
          fontFamily: FontFamily.kalpurush,
          fontWeight: FontWeight.bold,
          color: QuranColor.textColorLight,
        ),
        bodyMedium: const TextStyle(
          color: QuranColor.textColorLight,
          fontFamily: FontFamily.kalpurush,
          height: 1.6,
        ),
        labelSmall: const TextStyle(color: Colors.white)),
    colorScheme: const ColorScheme(
      scrim: QuranColor.primaryColorLight, //set for setting page title color
      background: Color(0xFFF3F3F3),
      brightness: Brightness.light,
      error: Color(0xFFB00020),
      onBackground: Color(0xFF000000),
      onError: Color(0xFFFFFFFF),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFF000000),
      errorContainer: Color(0xFFFCF3F3),
      onSurface: Color(0xFF000000),
      primary: QuranColor.primaryColorLight,
      secondary: QuranColor.secondaryColorLight,
      //surface: set for check box color dark and light,
      surface: QuranColor.primaryColorLight,
      inverseSurface: QuranColor.scaffoldBachgroundColorLight,
    ).copyWith(error: const Color(0xffF95B53)),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: FontFamily.kalpurush,
    checkboxTheme: CheckboxThemeData(
      side: BorderSide(
        color: QuranColor.textColorDark.withOpacity(0.3),
        width: 2,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.5)),
    ),
    bannerTheme:
        const MaterialBannerThemeData(backgroundColor: Color(0xff7F909F)),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xff122337),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //backgroundColor: Colors.red,
        ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(QuranColor.textColorDark),
      visualDensity: const VisualDensity(horizontal: -4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Color(0xff7F909F)),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF585868)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xff17B686)),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xff17B686)),
      ),
      focusColor: QuranColor.textColorDark,
      labelStyle: TextStyle(color: Color(0xff17B686)),
      hoverColor: Color(0xff17B686),
      fillColor: Color(0xff223449),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: QuranColor.textColorDark,
      selectionColor: QuranColor.textColorDark.withOpacity(0.5),
      selectionHandleColor: QuranColor.textColorDark,
    ),
    disabledColor: const Color(0xff7F909F),
    secondaryHeaderColor: const Color(0xff17B686),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.amber),
    cardColor: QuranColor.cardColorDark,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(0xff122337),
      modalBackgroundColor: Color(0xff223449),
    ),
    appBarTheme: const AppBarTheme(
      shadowColor: Colors.black,
      backgroundColor: QuranColor.secondaryColorDark,
      foregroundColor: Color(0xff477848),
      elevation: 0,
      iconTheme: IconThemeData(color: QuranColor.textColorDark),
      scrolledUnderElevation: 0,
    ),
    primaryColor: QuranColor.primaryColorDark,
    scaffoldBackgroundColor: QuranColor.scaffoldBachgroundColorDark,
    primaryColorDark: const Color(0xff122337),
    dividerColor: const Color(0xFF585868),
    iconTheme: const IconThemeData(color: Color(0xff7F909F)),
    textTheme: TextTheme(
        bodyLarge: const TextStyle(color: Colors.white),
        bodyMedium: const TextStyle(
          color: QuranColor.textColorDark,
          fontFamily: FontFamily.kalpurush,
          height: 1.6,
        ),
        displayLarge: const TextStyle(color: QuranColor.textColorDark),
        displayMedium: const TextStyle(color: Colors.white),
        displaySmall: const TextStyle(color: Colors.white),
        headlineMedium: const TextStyle(color: Colors.white),
        headlineSmall: const TextStyle(color: Colors.white),
        titleLarge: const TextStyle(color: Colors.white),
        titleMedium: const TextStyle(
          fontFamily: FontFamily.kalpurush,
          fontWeight: FontWeight.bold,
          color: QuranColor.textColorDark,
        ),
        titleSmall: const TextStyle(color: Colors.white),
        labelLarge: const TextStyle(color: Colors.white),
        bodySmall: TextStyle(
          color: QuranColor.textColorDark.withOpacity(0.6),
          fontFamily: FontFamily.kalpurush,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: const TextStyle(color: QuranColor.textColorLight)),
    colorScheme: const ColorScheme.dark(
      scrim: QuranColor.textColorDark, //set for setting page title color
      primary: QuranColor.textColorDark,
      secondary: QuranColor.secondaryColorDark,
      //surface: set for check box color dark and light,
      surface: QuranColor.textColorDark,
      inverseSurface: QuranColor.scaffoldBachgroundColorDark,
    ).copyWith(background: const Color(0xff122337)),
  );
}

Future<SystemUiOverlayStyle?> getSystemUiOverlayStyle({
  bool? isDark,
  BuildContext? context,
}) async {
  final SystemUiOverlayStyle? uiOverlayStyle =
      await catchAndReturnFuture(() async {
    final ThemeData theme = Theme.of(context ?? SunnahSongi.globalContext);
    final Color statusBarColor = isDark == null
        ? theme.primaryColor
        : (isDark ? const Color(0x00ffffff) : const Color(0x00ffffff));
    final Color systemNavigationBarColor = isDark == null
        ? theme.cardColor
        : (isDark ? const Color(0xff161C23) : const Color(0xffffffff));
    return SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
  });
  return uiOverlayStyle;
}

Future<T?> catchAndReturnFuture<T>(FutureOr<T> Function() function) async {
  try {
    return await function();
  } catch (error, trace) {
    logErrorStatic("error: $error trace: $trace", packageName);
    return null;
  }
}
