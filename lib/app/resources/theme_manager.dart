import 'package:flutter/material.dart';
import 'package:icloudready/app/resources/color_manager.dart';
import 'package:icloudready/app/resources/font_manager.dart';
import 'package:icloudready/app/resources/style_manager.dart';
import 'package:icloudready/app/resources/value_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //Colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,

    //Cards Theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    //AppBar Theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.transparent,
        iconTheme: IconThemeData(color: ColorManager.primary),
        elevation: AppSize.s0,
        shadowColor: ColorManager.primary.withOpacity(0.3),
        titleTextStyle: getRegularStyle(
          color: ColorManager.black,
          fontSize: FontSize.s16,
        )),

    //Button Theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),

    //Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
              color: ColorManager.white,
              fontSize: FontSize.s17,
            ),
            backgroundColor: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    //Text Theme
    textTheme: TextTheme(
      displayLarge:
          getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s24),
      displayMedium:
          getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s24),
      titleLarge:
          getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s18),
      titleMedium:
          getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s16),
      titleSmall:
          getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s16),
      bodySmall:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s12),
      bodyMedium:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
    ),

    dialogTheme: DialogTheme(
        backgroundColor: ColorManager.white,
        titleTextStyle:
            getBoldStyle(color: ColorManager.black, fontSize: FontSize.s18),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s16)),
        contentTextStyle: getRegularStyle(color: ColorManager.black),
        alignment: Alignment.center),
    iconTheme: IconThemeData(color: ColorManager.primary),

    //Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s14,
      ),
      labelStyle: getMediumStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s14,
      ),
      errorStyle: getRegularStyle(color: ColorManager.error, height: 1),
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
    ),
  );
}

ThemeData getDarkApplicationTheme() {
  return ThemeData(
    //Colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,

    //Cards Theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    //AppBar Theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.transparent,
        iconTheme: IconThemeData(color: ColorManager.white),
        elevation: AppSize.s0,
        shadowColor: ColorManager.primary.withOpacity(0.3),
        titleTextStyle: getRegularStyle(
          color: ColorManager.black,
          fontSize: FontSize.s16,
        )),

    //Button Theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),

    //Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
              color: ColorManager.white,
              fontSize: FontSize.s17,
            ),
            backgroundColor: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    //Text Theme
    textTheme: TextTheme(
      displayLarge:
          getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s24),
      displayMedium:
          getBoldStyle(color: ColorManager.white, fontSize: FontSize.s24),
      titleLarge:
          getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s18),
      titleMedium:
          getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s16),
      titleSmall:
          getBoldStyle(color: ColorManager.white, fontSize: FontSize.s16),
      bodySmall:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s12),
      bodyMedium:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
    ),

    dialogTheme: DialogTheme(
        backgroundColor: ColorManager.white,
        titleTextStyle:
            getBoldStyle(color: ColorManager.black, fontSize: FontSize.s18),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s16)),
        contentTextStyle: getRegularStyle(color: ColorManager.black),
        alignment: Alignment.center),

    //Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s14,
      ),
      labelStyle: getMediumStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s14,
      ),
      errorStyle: getRegularStyle(color: ColorManager.error, height: 1),
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
    ),
    scaffoldBackgroundColor: ColorManager.primary,
    colorScheme: ColorScheme(
            background: ColorManager.primary,
            onBackground: ColorManager.primary,
            brightness: Brightness.dark,
            primary: ColorManager.primary,
            onPrimary: ColorManager.primary,
            secondary: ColorManager.lightPrimary,
            onSecondary: ColorManager.primary,
            error: ColorManager.error,
            onError: ColorManager.error,
            surface: ColorManager.accent,
            onSurface: ColorManager.accent)
        .copyWith(background: ColorManager.primary),
  );
}
