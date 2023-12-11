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
        elevation: AppSize.s0,
        shadowColor: ColorManager.lightGrey,
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
          getBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
      headlineMedium:
          getRegularStyle(color: ColorManager.darkGrey, fontSize: FontSize.s14),
      titleMedium:
          getMediumStyle(color: ColorManager.black, fontSize: FontSize.s16),
      bodySmall: getRegularStyle(
        color: ColorManager.grey1,
      ),
      bodyLarge: getRegularStyle(color: ColorManager.grey),
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
        color: ColorManager.grey,
        fontSize: FontSize.s14,
      ),
      errorStyle: getRegularStyle(color: ColorManager.error, height: 1),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.grey,
          width: AppSize.s0_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.lightPrimary,
          width: AppSize.s1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),
    ),
  );
}
