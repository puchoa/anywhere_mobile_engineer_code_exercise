import 'package:anywhere_code_exercise/flavor_config.dart';
import 'package:anywhere_code_exercise/main_common.dart';
import 'package:flutter/material.dart';

void main() {
  final simpsonsConfig = FlavorConfig(
    appTitle: "The  Simpsons  Character  Viewer",
    values: FlavorValues(
        baseUrl: "http://api.duckduckgo.com/?q=simpsons+characters&format=json",
        appBarColor: const Color.fromARGB(255, 97, 197, 218),
        appBarFontFamily: "SimpsonsFont",
        appBarFontColor: Colors.yellow,
        cardBackgroundColor: Colors.white,
        cardBackgroundSeletedColor: const Color.fromARGB(255, 218, 216, 216),
        listBackgroundColor: const Color.fromARGB(255, 241, 240, 240),
        bodyColor: Colors.black,
        displayColor: Colors.black,
        searchItemColor: Colors.black),
  );

  mainCommon(simpsonsConfig);
}
