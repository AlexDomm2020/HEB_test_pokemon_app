import 'package:flutter/cupertino.dart';

class PokeConstants {
  static Size getMediaQuery(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static getTextSizeSmall(BuildContext context) {
    return getMediaQuery(context).width * 0.03;
  }

  static getTextSizeMedium(BuildContext context) {
    return getMediaQuery(context).width * 0.035;
  }

  static getTextSizeMediumLarge(BuildContext context) {
    return getMediaQuery(context).width * 0.04;
  }

  static getTextSizeLarge(BuildContext context) {
    return getMediaQuery(context).width * 0.05;
  }
}
