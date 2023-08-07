import 'dart:async';

import 'package:anywhere_code_exercise/flavor_config.dart';
import 'package:anywhere_code_exercise/models/related_topic_model.dart';
import 'package:anywhere_code_exercise/repos/repositories.dart';
import 'package:anywhere_code_exercise/responsive/mobile_body.dart';
import 'package:anywhere_code_exercise/responsive/device_check.dart';
import 'package:anywhere_code_exercise/responsive/tablet_body.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

StreamController<RelatedTopic> characterIndexStreamController =
    StreamController<RelatedTopic>();
StreamController<List<RelatedTopic>> characterListStreamController =
    StreamController<List<RelatedTopic>>();

Future<void> mainCommon(FlavorConfig config) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Code Exercise",
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: FlavorConfig.instance.values.appBarColor,
          ),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: FlavorConfig.instance.values.bodyColor,
                displayColor: FlavorConfig.instance.values.displayColor,
              ),
        ),
        home: RepositoryProvider(
            create: (context) => CharacterRepository(),
            child: const DeviceCheck(
                mobileBody: MobileBody(), tabletBody: TabletBody())));
  }
}
