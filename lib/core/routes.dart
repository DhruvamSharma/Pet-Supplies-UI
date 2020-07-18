import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petsupplies/main.dart';
import 'package:petsupplies/splash_screen.dart';
import 'package:petsupplies/supply_item_detail.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreenRoute.routeName:
        return _transitionRoute(
            ChangeNotifierProvider<SplashProgressNotifier>(
              create: (_) => SplashProgressNotifier(),
              child: SplashScreenRoute(),
            ),
            settings);
      case MyHomePage.routeName:
        return _transitionRoute(MyHomePage(), settings);
      case SupplyItemDetailRoute.routeName:
        final int index = settings.arguments;
        return _transitionRoute(SupplyItemDetailRoute(index), settings);
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Route Error'),
        ),
        body: Center(
          child: Text('This route does not exist'),
        ),
      );
    });
  }

  static PageRoute _transitionRoute(Widget route, RouteSettings settings) {
    return CupertinoPageRoute(
      builder: (_) => route,
      settings: settings,
    );
  }
}
