import 'package:anywhere_code_exercise/flavor_config.dart';
import 'package:anywhere_code_exercise/main_common.dart';
import 'package:flutter/material.dart';

void main() {
  final wireConfig = FlavorConfig(
      appTitle: "The Wire Character Viewer",
      values: FlavorValues(
          baseUrl:
              "http://api.duckduckgo.com/?q=the+wire+characters&format=json",
          appBarColor: Colors.black,
          appBarFontFamily: "WireFont",
          appBarFontColor: Colors.white,
          cardBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
          cardBackgroundSeletedColor: Colors.grey,
          listBackgroundColor: Colors.black,
          bodyColor: Colors.white,
          displayColor: Colors.white,
          searchItemColor: Colors.white));

  mainCommon(wireConfig);
}
