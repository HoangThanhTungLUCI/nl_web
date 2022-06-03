import 'package:flutter/material.dart';
import 'package:nl_web/core/generated/l10n.dart';
import 'package:nl_web/core/routes/routes.dart';
import 'package:nl_web/core/style/style.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application>
    with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// inactive - The application is in an inactive state and is not receiving user input.
  /// paused - The application is not currently visible to the user, not responding to user input, and running in the background.
  /// resumed - The application is visible and responding to user input.
  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.inactive:
        break;
      default:
        break;
    }
  }

  @override
  Future<bool> didPopRoute() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
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
      initialRoute: LuciRoutes.sampleFeature,
      onGenerateRoute: LuciRouter.generateRoute,
    );
  }
}
