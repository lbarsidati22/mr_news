import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_news/core/model/news_api_response.dart';
import 'package:mr_news/core/utils/route/app_routes.dart';
import 'package:mr_news/features/home/pages/home_details_page.dart';
import 'package:mr_news/features/home/pages/home_page.dart';
import 'package:mr_news/features/search/pages/search_page.dart';
import 'package:mr_news/features/search/search_cubit/search_cubit.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
          settings: settings,
        );
      case AppRoutes.homeDetails:
        final article = settings.arguments as Article;
        return MaterialPageRoute(
          builder: (_) => HomeDetailsPage(
            article: article,
          ),
          settings: settings,
        );
      case AppRoutes.searchPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SearchCubit(),
            child: SearchPage(),
          ),
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
