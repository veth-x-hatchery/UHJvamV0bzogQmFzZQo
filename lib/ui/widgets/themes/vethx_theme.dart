import 'dart:io';
import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/material/TextTheme-class.html

const brightness = Brightness.light;
const primaryColor = Color.fromRGBO(136, 197, 58, 1); //Color(0xFFB03030);
const lightColor = Color(0xFFFFFFFF);
const backgroundColor = Color(0xFFEEEEEE);
const greensigaviConnect = Color.fromRGBO(0, 255, 0, 1); //Color(0xFFB03030);

const blackZeroColor = Colors.black87;
const blackOneColor = Colors.black54;
const blackTwoColor = Colors.black12;

const whiteOne = Colors.white60;
const whiteTwo = Colors.white38;

const textButtonBackgroundColorHome =
    Color.fromRGBO(176, 29, 52, 1); //imagecolorpicker.com default-background
const textButtonBackgroundColorScanPage = Color.fromRGBO(67, 63, 120, 1);

const sigaviConnectGradientOne = Color.fromRGBO(136, 197, 58, 1);
const sigaviConnectGradientTwo = Color.fromRGBO(44, 69, 133, 1);

ThemeData sigaviConnectTemaPadrao() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useTextSelectionTheme: true,
    fontFamily: 'Oswald',
    textTheme: TextTheme(
      caption: TextStyle(
          fontFamily: 'Oswald',
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.black54),
      button: TextStyle(
          fontFamily: 'Oswald',
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.white),
      bodyText1: TextStyle(
        fontFamily: 'Oswald',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.black54,
      ),
      bodyText2: TextStyle(
        fontFamily: "Oswald",
        fontSize: Platform.isIOS ? 14 : 16,
        fontWeight: FontWeight.w100,
        fontStyle: FontStyle.normal,
        color: Colors.black87,
      ),
      headline1: TextStyle(
          fontFamily: 'Oswald',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: primaryColor),
      headline2: TextStyle(
          fontFamily: 'Oswald',
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: primaryColor),
      headline3: TextStyle(
          fontFamily: 'Oswald',
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: primaryColor),
      headline4: TextStyle(
          fontFamily: 'Oswald',
          fontSize: 36,
          fontWeight: FontWeight.w600,
          color: primaryColor),
      headline5: TextStyle(
          fontFamily: 'Oswald',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black87),
      headline6: TextStyle(
          fontFamily: 'Oswald',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.black87),
      subtitle1: TextStyle(
          fontFamily: 'Oswald',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black87),
      subtitle2: TextStyle(
          fontFamily: 'Oswald',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.black54),
      //TextStyle(fontSize: 16, color: Colors.grey.withOpacity(0.8))
    ),
    disabledColor: lightColor,
    brightness: brightness,
    canvasColor: Colors.transparent,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.black,
      textTheme: ButtonTextTheme.accent,
    ),
    scaffoldBackgroundColor: backgroundColor,
    backgroundColor: backgroundColor,
    accentColor: primaryColor, //DurationPicker sigaviConnects_theme.blackColor,
    primaryColor: primaryColor,
    primaryColorLight: lightColor,
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(
        fontFamily: 'Oswald',
        fontWeight: FontWeight.w700,
        fontSize: 12,
      ), //SizeConfig.safeBlockHorizontal * 4
      unselectedLabelStyle: TextStyle(
        fontFamily: 'Oswald',
        fontWeight: FontWeight.w700,
        fontSize: 12,
      ), //SizeConfig.safeBlockHorizontal * 4
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: lightColor,
          width: 1,
        ),
      ),
      labelColor: lightColor,
      unselectedLabelColor: Colors.black54,
    ),
  );
}
