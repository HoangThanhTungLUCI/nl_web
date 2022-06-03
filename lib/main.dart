import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nl_web/core/di/injection/injection.dart';
import 'package:nl_web/core/environment/env.dart';
import 'package:nl_web/core/style/style.dart';
import 'package:nl_web/application.dart';

import 'ui_change_password_page.dart';

main() {
  // SetupEnv();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      home: UiForgotPass(),
    );
  }
}

//////////////////
class SetupEnv extends Env {
  @override
  Future? onInjection() async {
    await Injection.inject();
  }

  @override
  FutureOr<void> onCreate() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    AppStyles.setStyleDefault();
  }

  @override
  Widget onCreateView() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return Container(color: Colors.transparent);
    };
    return const Application();
  }
}
