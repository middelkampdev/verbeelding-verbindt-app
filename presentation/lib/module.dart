import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/enums/environment_enum.dart';

import 'global_bloc_observer.dart';

final serviceLocator = GetIt.instance;

class Module {
  static Future<void> initialize(
    Environment environment,
  ) async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    FlutterError.onError = (details) {
      log(details.exceptionAsString(), stackTrace: details.stack);
    };
    if (environment == Environment.prod) {
      debugPrint = (message, {wrapWidth}) {};
    }
    Bloc.observer = GlobalBlocObserver();
  }
}