import 'package:flutter/material.dart';

class FlavorValues {
  FlavorValues(
      {required this.baseUrl,
      required this.appBarColor,
      required this.appBarFontFamily,
      required this.appBarFontColor,
      required this.cardBackgroundColor,
      required this.cardBackgroundSeletedColor,
      required this.listBackgroundColor,
      required this.bodyColor,
      required this.displayColor,
      required this.searchItemColor});
  final String baseUrl;
  final Color appBarColor;
  final String appBarFontFamily;
  final Color appBarFontColor;
  final Color cardBackgroundColor;
  final Color cardBackgroundSeletedColor;
  final Color listBackgroundColor;
  final Color bodyColor;
  final Color displayColor;
  final Color searchItemColor;
}

class FlavorConfig {
  final String appTitle;
  final FlavorValues values;
  static FlavorConfig _instance = FlavorConfig(
      appTitle: "AppTitle",
      values: FlavorValues(
          baseUrl: "testUrl",
          appBarColor: Colors.green,
          appBarFontFamily: "fontFamily",
          appBarFontColor: Colors.white,
          cardBackgroundColor: Colors.white,
          cardBackgroundSeletedColor: Colors.white,
          listBackgroundColor: Colors.white,
          bodyColor: Colors.white,
          displayColor: Colors.white,
          searchItemColor: Colors.white));

  factory FlavorConfig({required appTitle, required FlavorValues values}) {
    _instance = FlavorConfig._internal(appTitle, values);
    return _instance;
  }

  FlavorConfig._internal(this.appTitle, this.values);
  static FlavorConfig get instance {
    return _instance;
  }
}
