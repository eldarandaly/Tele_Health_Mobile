import 'package:flutter/material.dart';
import 'package:telehealthcare/bottom_bar_nav/src/model/dactor_model.dart';
import 'package:telehealthcare/bottom_bar_nav/src/model/patient%20_model.dart';
import 'package:telehealthcare/bottom_bar_nav/src/pages/detail_page_patient.dart';
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
      case "DetailPagePatient":
        return CustomRoute<bool>(
            settings: settings,
            builder: (BuildContext context) => DetailPagePatient(
                  model: settings.arguments as PatientModel,
                  key: null,
                ));
    }

    return null;
  }
}
