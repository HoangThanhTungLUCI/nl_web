import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nl_web/core/base/presentation/bloc/app_bloc_observer'
    '.dart';
import 'package:nl_web/core/environment/build_config.dart';
import 'package:nl_web/core/services/api/http_overrides.dart';
import 'package:nl_web/core/utility/logging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class Env {
  Env() {
    _init();
  }

  _init() async {
    // This is required for accessing the method channel before runApp().
    // Ensure that the Flutter Framework is available to access
    WidgetsFlutterBinding.ensureInitialized();

    FlutterError.onError = (error) {
      // dumps errors to console
      FlutterError.dumpErrorToConsole(error);
      // re-throws error so that `runZoned` handles it
      throw error;
    };

    final StatefulWidget app = FutureBuilder(
      future: await _onCreate(),
      builder: (context, snapshot) {
        return onCreateView();
      },
    );

    BlocOverrides.runZoned(
      () {
        runApp(app);
      },
      blocObserver: AppBlocObserver(),
    );
  }

  Future? onInjection();

  FutureOr<void> onCreate();

  Widget onCreateView();

  Future? _onCreate() async {
    await const MethodChannel('flavor').invokeMethod<String>('getFlavor').then(
      (String? flavor) async {
        BuildConfig.init(flavor: flavor);
      },
    ).catchError((error) {
      Log.warning("Env onCreate()", error.toString());
      BuildConfig.init(flavor: Flavor.development.name);
    });
    HttpOverrides.global = MyHttpOverrides();

    await onInjection();
    await onCreate();
  }
}
