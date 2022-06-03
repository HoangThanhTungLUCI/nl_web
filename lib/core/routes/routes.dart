import 'package:flutter/material.dart';
import 'package:nl_web/core/base/presentation/bloc/base_bloc.dart';
import 'package:nl_web/core/di/di_module.dart';
import 'package:nl_web/core/style/style.dart';
import 'package:nl_web/features/_sample_feature/presentation/bloc/post_bloc.dart';
import 'package:nl_web/features/_sample_feature/presentation/pages/post_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LuciRoutes {
  static const sampleFeature = '/sample_feature';
  static const initialRoute = '/';
  static const signIn = '/sign_in';
  static const home = '/home';
}

class LuciRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LuciRoutes.sampleFeature:
        return MaterialPageRoute(
          builder: _buildRoute(
            sl<PostBloc>(),
            const PostsPage(),
            ApplicationTheme(),
          ),
        );
/*      case LuciRoutes.sampleFeature:
        return MaterialPageRoute(builder: (context) {
          return Theme(
            data: MediaQuery.of(context).platformBrightness == Brightness.light
                ? ApplicationTheme().lightTheme
                : ApplicationTheme().darkTheme,
            child: TestUIPage(),
          );
        });*/
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

WidgetBuilder _buildRoute<T extends BaseBloc, P extends Widget>(
    T bloc, P page, AppTheme theme) {
  return (BuildContext context) => BlocProvider(
        create: (context) => sl<T>(),
        child: Theme(
          data: MediaQuery.of(context).platformBrightness == Brightness.light
              ? theme.lightTheme
              : theme.darkTheme,
          child: page,
        ),
      );
}

WidgetBuilder _buildRouteWithoutTheme<T extends BaseBloc, P extends Widget>(
    T bloc, P page) {
  return (BuildContext context) => BlocProvider(
        create: (context) => sl<T>(),
        child: page,
      );
}
