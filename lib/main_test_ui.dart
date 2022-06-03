import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nl_web/core/generated/l10n.dart';
import 'package:nl_web/core/style/style.dart';
import 'package:nl_web/test_ui_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() {
  setStyleDefault();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      theme: ApplicationTheme().lightTheme,
      darkTheme: ApplicationTheme().darkTheme,
      onGenerateTitle: (context) {
        return S.of(context).connection_problem;
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        if (supportedLocales
            .map((e) => e.languageCode)
            .contains(deviceLocale?.languageCode)) {
          return deviceLocale;
        } else {
          return const Locale('en', '');
        }
      },
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      home: TestUIPage(),
    ),
  );
}

void setStyleDefault() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColor.mCInk900,
      systemNavigationBarIconBrightness: Brightness.light));
}
