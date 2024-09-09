import 'package:document_analyser_poc_new/utils/app_enums.dart';
import 'package:flutter/material.dart';

/// Class containing helper methods for the app
class AppHelpers {
  static GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();

  /// Method to get the device size based on width
  static Devices getDevice(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width <= 320) {
      return Devices.smallMobile;
    } else if (width > 320 && width <= 480) {
      return Devices.mobile;
    } else if (width > 480 && width <= 768) {
      return Devices.smallWebpage;
    } else if (width > 768 && width <= 1024) {
      return Devices.tablet;
    } else {
      return Devices.webpage;
    }
  }
}
