import 'package:flutter/material.dart';
import 'package:mr_news/core/utils/route/app_routes.dart';
import 'package:mr_news/features/home/pages/home_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route definde Here ${settings.name}'),
            ),
          ),
          settings: settings,
        );
    }
  }
}
