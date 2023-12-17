import 'package:flutter/material.dart';
import 'dart:io';

class ResponsiveAdaptiveClass {
  var orientation;
  var size;
  var height;
  var width;
  double fontSizeValue = 0.0;
  double classFontSize = 0.0;
  double appBarTitleFontSize = 0.0;
  double elevatedButtonWidth = 0.0;
  double elevatedButtonHeight = 0.0;
  double classImageHeight = 0.0;
  double classImageWidth = 0.0;
  void selectPlatformType() {
    if (Platform.isAndroid) {
      // debugPrint('Running on Android');
    } else if (Platform.isIOS) {
      // debugPrint('Running on iOS');
      // if ((orientation == Orientation.portrait) && (width >= 744 && width <= 833)) {
      // } else if ((orientation == Orientation.portrait) && (width >= 834 && width <= 1024)) {
      // } else if ((orientation == Orientation.landscape) && (width >= 1024 && width <= 1079)) {
      // } else if ((orientation == Orientation.landscape) && (width >= 1133 && height <= 744)) {
      // } else if ((orientation == Orientation.landscape) && (width >= 1080 && width <= 1366)) {
      // } else if ((orientation == Orientation.portrait) && (width >= 375 && height <= 667)) {
      // } else if ((orientation == Orientation.landscape) && (width >= 667 && height <= 375)) {
      // } else if ((orientation == Orientation.portrait) && (width >= 375 && width <= 430)) {
      // } else if ((orientation == Orientation.landscape) && (width >= 480 && width <= 932)) {
      // } else if ((orientation == Orientation.portrait) && (width >= 800 && width <= 600)) {}
    } else if (Platform.isWindows) {
      debugPrint('Running on Windows');
    } else if (Platform.isLinux) {
      debugPrint('Running on Linux');
    } else if (Platform.isMacOS) {
      debugPrint('Running on macOS');
    } else {
      debugPrint('Running on an unknown platform');
    }
  }

  double selectFontSize(double scaleFactor) {
    if (Platform.isIOS) {
      // small iPhones: 375 w x 667 h
      if ((orientation == Orientation.portrait) && (width >= 375 && height <= 667)) {
        classFontSize = 14.0 * scaleFactor;
        return classFontSize;
      } else if ((orientation == Orientation.landscape) && (width >= 667 && height <= 375)) {
        classFontSize = 14.0 * scaleFactor;
        return classFontSize;
      }
      // small iPhones: 375 w x 812 h
      if ((orientation == Orientation.portrait) && (width >= 375 && height <= 812)) {
        classFontSize = 18.0 * scaleFactor;
        return classFontSize;
      } else if ((orientation == Orientation.landscape) && (width >= 812 && height <= 375)) {
        classFontSize = 18.0 * scaleFactor;
        return classFontSize;
      }
      // iPhones: 390 w to 430 w x 844 h to 932 h
      if ((orientation == Orientation.portrait) &&
          ((width >= 390 && width <= 430) && (height >= 844 && height <= 932))) {
        classFontSize = 20.0 * scaleFactor;
        // debugPrint('390 w x 932 h Portrait classFontSize: $classFontSize');
        return classFontSize;
      } else if ((orientation == Orientation.landscape) && (width >= 844 && height <= 430)) {
        classFontSize = 18.0 * scaleFactor;
        // debugPrint('390 w x 932 h Landscape classFontSize: $classFontSize');
        return classFontSize;
      }
      // iPads: 744 w to 834 w x 1024 h to 1194 h
      if ((orientation == Orientation.portrait) &&
          ((width >= 744 && width <= 834) && (height >= 1024 && height <= 1194))) {
        classFontSize = 20.0 * scaleFactor;
        // debugPrint(
        //     'iPads: 744 w to 834 w x 1024 h to 1194 h Portrait classFontSize: $classFontSize');
        return classFontSize;
      } else if ((orientation == Orientation.landscape) &&
          ((height >= 744 && height <= 834) && (width >= 1024 && width <= 1194))) {
        classFontSize = 22.0 * scaleFactor;
        // debugPrint(
        //     'iPads: 744 w to 834 w x 1024 h to 1194 h Landscape classFontSize: $classFontSize');
        return classFontSize;
      }
      // iPads: 1024 w x 1366 h
      if ((orientation == Orientation.portrait) && ((width >= 1024) && (height <= 1366))) {
        classFontSize = 30.0 * scaleFactor;
        // debugPrint(
        //     'iPads: 744 w to 834 w x 1024 h to 1194 h Portrait classFontSize: $classFontSize');
        return classFontSize;
      } else if ((orientation == Orientation.landscape) && ((height >= 1366) && (width <= 1024))) {
        classFontSize = 30.0 * scaleFactor;
        // debugPrint(
        //     'iPads: 744 w to 834 w x 1024 h to 1194 h Landscape classFontSize: $classFontSize');
        return classFontSize;
      }
      //macOS
      if ((orientation == Orientation.portrait) && ((width >= 800) && (height <= 600))) {
        classFontSize = 30.0 * scaleFactor;
        // debugPrint(
        //     'iPads: 744 w to 834 w x 1024 h to 1194 h Portrait classFontSize: $classFontSize');
        return classFontSize;
      } else if ((orientation == Orientation.landscape) && ((height >= 600) && (width <= 800))) {
        classFontSize = 30.0 * scaleFactor;
        // debugPrint(
        //     'iPads: 744 w to 834 w x 1024 h to 1194 h Landscape classFontSize: $classFontSize');
        return classFontSize;
      }
    }

    return classFontSize;
  }

  double selectAppBarTitleFontSize(double scaleFactor) {
    if (Platform.isIOS) {
      // small iPhones: 375 w x 667 h
      if ((orientation == Orientation.portrait) && (width >= 375 && height <= 667)) {
        appBarTitleFontSize = 18.0 * scaleFactor;
        return appBarTitleFontSize;
      } else if ((orientation == Orientation.landscape) && (width >= 667 && height <= 375)) {
        appBarTitleFontSize = 22.0 * scaleFactor;
        return appBarTitleFontSize;
      }
      // iPhones: 375 w x 812 h
      if ((orientation == Orientation.portrait) && (width >= 375 && height <= 812)) {
        appBarTitleFontSize = 20.0 * scaleFactor;
        return appBarTitleFontSize;
      } else if ((orientation == Orientation.landscape) && (width >= 812 && height <= 375)) {
        appBarTitleFontSize = 22.0 * scaleFactor;
        return appBarTitleFontSize;
      }
      // iPhones: 390 w to 430 w x 844 h to 932 h
      if ((orientation == Orientation.portrait) &&
          ((width >= 390 && width <= 430) && (height >= 844 && height <= 932))) {
        appBarTitleFontSize = 20.0 * scaleFactor;
        // debugPrint('390 w x 932 h Portrait appBarTitleFontSize: $appBarTitleFontSize');
        return appBarTitleFontSize;
      } else if ((orientation == Orientation.landscape) && (width >= 844 && height <= 430)) {
        appBarTitleFontSize = 18.0 * scaleFactor;
        // debugPrint('390 w x 932 h Landscape appBarTitleFontSize: $appBarTitleFontSize');
        return appBarTitleFontSize;
      }
      // iPads: 744 w to 834 w x 1024 h to 1194 h
      if ((orientation == Orientation.portrait) &&
          ((width >= 744 && width <= 834) && (height >= 1024 && height <= 1194))) {
        appBarTitleFontSize = 20.0 * scaleFactor;
        // debugPrint(
        //     'iPads: 744 w to 834 w x 1024 h to 1194 h Portrait appBarTitleFontSize: $appBarTitleFontSize');
        return appBarTitleFontSize;
      } else if ((orientation == Orientation.landscape) &&
          ((height >= 744 && height <= 834) && (width >= 1024 && width <= 1194))) {
        appBarTitleFontSize = 22.0 * scaleFactor;
        // debugPrint(
        //     'iPads: 744 w to 834 w x 1024 h to 1194 h Landscape classFontSize: $appBarTitleFontSize');
        return appBarTitleFontSize;
      }
      // iPads: 1024 w x 1366 h
      if ((orientation == Orientation.portrait) && ((width >= 1024) && (height <= 1366))) {
        appBarTitleFontSize = 30.0 * scaleFactor;
        // debugPrint(
        //     'iPads: 744 w to 834 w x 1024 h to 1194 h Portrait appBarTitleFontSize: $appBarTitleFontSize');
        return appBarTitleFontSize;
      } else if ((orientation == Orientation.landscape) && ((height >= 1366) && (width <= 1024))) {
        appBarTitleFontSize = 30.0 * scaleFactor;
        // debugPrint(
        //     'iPads: 744 w to 834 w x 1024 h to 1194 h Landscape classFontSize: $appBarTitleFontSize');
        return appBarTitleFontSize;
      }
      if ((orientation == Orientation.portrait) && ((width >= 800) && (height <= 600))) {
        appBarTitleFontSize = 30.0 * scaleFactor;
        // debugPrint(
        //     'iPads: 744 w to 834 w x 1024 h to 1194 h Portrait appBarTitleFontSize: $appBarTitleFontSize');
        return appBarTitleFontSize;
      } else if ((orientation == Orientation.landscape) && ((height >= 600) && (width <= 800))) {
        appBarTitleFontSize = 30.0 * scaleFactor;
        // debugPrint(
        //     'iPads: 744 w to 834 w x 1024 h to 1194 h Landscape classFontSize: $appBarTitleFontSize');
        return appBarTitleFontSize;
      }
    }

    return appBarTitleFontSize;
  }

  double selectClassImageHeight() {
    if (Platform.isIOS) {
      // small iPhones: 375 w x 667 h
      if ((orientation == Orientation.portrait) && (width >= 375 && height <= 667)) {
        classImageHeight = height * 0.12;
        // debugPrint('375 w x 667 h Portrait classImageHeight: $classImageHeight');
        return classImageHeight;
      } else if ((orientation == Orientation.landscape) &&
          (width >= 667 && height <= 375 && (width <= 811))) {
        classImageHeight = height * 0.15;
        // debugPrint('375 w x 667 h Landscape classImageHeight: $classImageHeight');
        return classImageHeight;
      }
      // iPhones: 375 w x 812 h
      if ((orientation == Orientation.portrait) && (width >= 375 && height <= 812)) {
        classImageHeight = height * 0.10;
        // debugPrint('375 w x 812 h Portrait classImageHeight: $classImageHeight');
        return classImageHeight;
      } else if ((orientation == Orientation.landscape) && (width >= 812 && height <= 375)) {
        classImageHeight = height * 0.15;
        // debugPrint('375 w x 812 h Landscape classImageHeight: $classImageHeight');
        return classImageHeight;
      }
      // iPhones: 390 w to 430 w x 844 h to 932 h
      if ((orientation == Orientation.portrait) &&
          ((width >= 390 && width <= 430) && (height >= 844 && height <= 932))) {
        classImageHeight = height * 0.22; //Image H
        // debugPrint('390 w x 932 h Portrait classImageHeight: $classImageHeight');
        return classImageHeight;
      } else if ((orientation == Orientation.landscape) && (width >= 844 && height <= 430)) {
        classImageHeight = height * 0.15;
        // debugPrint('390 w x 932 h Landscape classImageHeight: $classImageHeight');
        return classImageHeight;
      }
      // iPads: 744 w to 834 w x 1024 h to 1194 h
      if ((orientation == Orientation.portrait) &&
          ((width >= 744 && width <= 834) && (height >= 1024 && height <= 1194))) {
        classImageHeight = height * 0.0935;
        // debugPrint(
        //     'iPads: 744 w to 834 w x 1024 h to 1194 h Portrait classImageHeight: $classImageHeight');
        return classImageHeight;
      } else if ((orientation == Orientation.landscape) &&
          ((height >= 744 && height <= 834) && (width >= 1024 && width <= 1194))) {
        classImageHeight = height * 0.15;
        // debugPrint(
        //     'iPads: 744 w to 834 w x 1024 h to 1194 h Landscape classImageHeight: $classImageHeight');
        return classImageHeight;
      }
    }

    return classImageHeight;
  }

  double selectClassImageWidth() {
    if (Platform.isIOS) {
      // small iPhones: 375 w x 667 h
      if ((orientation == Orientation.portrait) && (width >= 375 && height <= 667)) {
        classImageWidth = width * 0.1;
        // debugPrint('375 w x 667 h Portrait classImageWidth: $classImageWidth');
        return classImageWidth;
      } else if ((orientation == Orientation.landscape) &&
          (width >= 667 && height <= 375) &&
          (width <= 811)) {
        classImageWidth = width * 0.085;
        // debugPrint('375 w x 667 h Landscape classImageWidth: $classImageWidth');
        return classImageWidth;
      }
      // iPhones: 375 w x 812 h
      if ((orientation == Orientation.portrait) && (width >= 375 && height <= 812)) {
        classImageWidth = width * 0.21;
        // debugPrint('375 w x 812 h Portrait classImageWidth: $classImageWidth');
        return classImageWidth;
      } else if ((orientation == Orientation.landscape) && (width >= 812 && height <= 375)) {
        classImageWidth = width * 0.07;
        // debugPrint('375 w x 812 h Landscape classImageWidth: $classImageWidth');
        return classImageWidth;
      }
      // iPhones: 390 w to 430 w x 844 h to 932 h
      if ((orientation == Orientation.portrait) &&
          ((width >= 390 && width <= 430) && (height >= 844 && height <= 932))) {
        classImageWidth = width * 0.3;
        // debugPrint('390 w x 932 h Portrait classImageWidth: $classImageWidth');
        return classImageWidth;
      } else if ((orientation == Orientation.landscape) && (width >= 844 && height <= 430)) {
        classImageWidth = width * 0.06;
        // debugPrint('390 w x 932 h Landscape classImageWidth: $classImageWidth');
        return classImageWidth;
      }
      // iPads: 744 w to 834 w x 1024 h to 1194 h
      if ((orientation == Orientation.portrait) &&
          ((width >= 744 && width <= 834) && (height >= 1024 && height <= 1194))) {
        classImageWidth = width * 0.20;
        // debugPrint(
        //     'iPads: 744 w to 834 w x 1024 h to 1194 h Portrait classImageWidth: $classImageWidth');
        return classImageHeight;
      } else if ((orientation == Orientation.landscape) &&
          ((height >= 744 && height <= 834) && (width >= 1024 && width <= 1194))) {
        classImageWidth = width * 0.07;
        // debugPrint(
        //     'iPads: 744 w to 834 w x 1024 h to 1194 h Landscape classImageWidth: $classImageWidth');
        return classImageWidth;
      }
    }

    return classImageWidth;
  }

  double selectElevatedButtonHeight() {
    if (Platform.isIOS) {
      // small iPhones: 375 w x 667 h
      if ((orientation == Orientation.portrait) && (width >= 375 && height <= 667)) {
        elevatedButtonHeight = height / 12.0;
        return elevatedButtonHeight;
      } else if (orientation == Orientation.landscape) {
        elevatedButtonHeight = height / 6.6;
        return elevatedButtonHeight;
      }
      //  iPhones: 375 w x 812 h
      if ((orientation == Orientation.portrait) && (width >= 375 && height <= 812)) {
        elevatedButtonHeight = height / 16.0;
        return elevatedButtonHeight;
      } else if ((orientation == Orientation.landscape) && (width >= 812 && height <= 375)) {
        elevatedButtonHeight = height / 6.6;
        return elevatedButtonHeight;
      }
      // iPhones: 390 w to 430 w x 844 h to 932 h
      if ((orientation == Orientation.portrait) &&
          ((width >= 390 && width <= 430) && (height >= 844 && height <= 932))) {
        elevatedButtonHeight = height / 8.0;
        return elevatedButtonHeight;
      } else if ((orientation == Orientation.landscape) && (width >= 844 && height <= 430)) {
        elevatedButtonHeight = height / 6.6;
        return elevatedButtonHeight;
      }
      // iPads: 744 w to 834 w x 1024 h to 1194 h
      if ((orientation == Orientation.portrait) &&
          ((width >= 744 && width <= 834) && (height >= 1024 && height <= 1194))) {
        elevatedButtonHeight = height / 16.0;
        return elevatedButtonHeight;
      } else if ((orientation == Orientation.landscape) &&
          ((height >= 744 && height <= 834) && (width >= 1024 && width <= 1194))) {
        elevatedButtonHeight = height / 6.6;
        return elevatedButtonHeight;
      }
      // iPads: 1024 w x 1366  h
      if ((orientation == Orientation.portrait) && ((width >= 1024) && (height <= 1366))) {
        elevatedButtonHeight = height / 16.0;
        return elevatedButtonHeight;
      } else if ((orientation == Orientation.landscape) && ((height >= 1366) && (width <= 1024))) {
        elevatedButtonHeight = height / 6.6;
        return elevatedButtonHeight;
      }
      if ((orientation == Orientation.portrait) && ((width >= 800) && (height <= 600))) {
        elevatedButtonHeight = height / 16.0;
        return elevatedButtonHeight;
      } else if ((orientation == Orientation.landscape) && ((height >= 600) && (width <= 800))) {
        elevatedButtonHeight = height / 6.6;
        return elevatedButtonHeight;
      }
    }

    return elevatedButtonHeight;
  }

  double selectElevatedButtonWidth() {
    if (Platform.isIOS) {
      if (orientation == Orientation.portrait) {
        elevatedButtonWidth = width * 1;
        return elevatedButtonWidth;
      } else if (orientation == Orientation.landscape) {
        elevatedButtonWidth = width * 0.60;
        return elevatedButtonWidth;
      }
    }

    return elevatedButtonWidth;
  }
}
