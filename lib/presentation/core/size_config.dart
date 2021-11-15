import "package:flutter/widgets.dart" ;

class SC {
  static MediaQueryData? _mediaQueryData;
  static double screenWidth = 0.0;
  static double screenHeight= 0.0;
  static double blockHorizontal= 0.0;
  static double blockVertical= 0.0;

  static double safeAreaHorizontal= 0.0;
  static double safeAreaVertical= 0.0;
  static double safeBlockHorizontal= 0.0;
  static double safeBlockVertical= 0.0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockHorizontal = screenWidth / 100;
    blockVertical = screenHeight / 100;

    safeAreaHorizontal = (_mediaQueryData!.padding.left) +
       _mediaQueryData!.padding.right;
    safeAreaVertical = (_mediaQueryData!.padding.top) +
        (_mediaQueryData!.padding.bottom);
    safeBlockHorizontal = (screenWidth -
        safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight -
        safeAreaVertical) / 100;
  }
}

