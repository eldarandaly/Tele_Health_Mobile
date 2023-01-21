import 'package:flutter/material.dart';
import 'package:telehealthcare/new_home/src/model/dactor_model.dart';
import '../pages/detail_page.dart';
import '../pages/new_home_page.dart';
import '../pages/splash_page.dart';
import '../widgets/coustom_route.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => SplashPage(),
      '/HomePage': (_) => CoolHomePage(),
    };
  }

  static Route? onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name!.split('/');
    if (pathElements[0] != '' || pathElements.length == 1) {
      return null;
    }
    switch (pathElements[1]) {
      case "DetailPage":
        return CustomRoute<bool>(
            settings: settings,
            builder: (BuildContext context) => DetailPage(
                  model: settings.arguments as DoctorModel,
                  key: null,
                ));
    }
    return null;
  }
}
