import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;

  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  static late double screenWidth;
  static late double screenHeight;

  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late EdgeInsets edgeDefault;
  static late EdgeInsets edgeDefaultOverTabBar;
  static late EdgeInsets edgeMaxSpace;
  static late EdgeInsets edgeDefaultWithoutBottom;
  static late EdgeInsets edgeBottomNavBar;

  static late bool isTablet;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;

    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

    edgeDefault = EdgeInsets.all(_safeAreaVertical * 0.7);

    edgeBottomNavBar = edgeDefault +
        EdgeInsets.only(
          left: screenWidth * 0.25,
          right: screenWidth * 0.25,
        );

    edgeDefaultOverTabBar = edgeDefault +
        EdgeInsets.only(
          bottom: _safeAreaVertical * 2,
        );

    edgeMaxSpace = EdgeInsets.all(25.0);

    isTablet = getDeviceType(_mediaQueryData) == DeviceScreenType.Tablet;
  }

  static EdgeInsetsGeometry get defaultEdgeInsetsAll =>
      EdgeInsets.all(defaultEdgeSpace);

  static double get defaultEdgeSpace => SizeConfig.screenWidth * 0.05;
}

enum DeviceScreenType { Mobile, Tablet, Desktop }

class SizingInformation {
  const SizingInformation({
    required this.orientation,
    required this.deviceType,
    required this.screenSize,
    required this.localWidgetSize,
  });

  final Orientation orientation;
  final DeviceScreenType deviceType;
  final Size screenSize;
  final Size localWidgetSize;

  @override
  String toString() {
    return 'Orientation:$orientation DeviceType:$deviceType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  final orientation = mediaQuery.orientation;

  double deviceWidth = 0;

  if (orientation == Orientation.landscape) {
    deviceWidth = mediaQuery.size.height;
  } else {
    deviceWidth = mediaQuery.size.width;
  }

  if (deviceWidth > 950) {
    return DeviceScreenType.Desktop;
  }

  if (deviceWidth > 600) {
    return DeviceScreenType.Tablet;
  }

  return DeviceScreenType.Mobile;
}

// var sizingInformation = SizingInformation(
//   orientation: mediaQuery.orientation,
//   deviceType: getDeviceType(mediaQuery),
//   screenSize: mediaQuery.size,
//   localWidgetSize: Size(boxSizing.maxWidth, boxSizing.maxHeight),
// );
