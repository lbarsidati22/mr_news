import 'package:flutter/material.dart';
import 'package:mr_news/core/utils/app_constants.dart';
import 'package:mr_news/core/utils/route/app_router.dart';
import 'package:mr_news/core/utils/route/app_routes.dart';
import 'package:mr_news/core/utils/theme/app_theme.dart';

void main() {
  runApp(const NewsMR());
}

class NewsMR extends StatelessWidget {
  const NewsMR({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: AppTheme.mainTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRoutes.home,
    );
  }
}
