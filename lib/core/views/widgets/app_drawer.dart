import 'package:flutter/material.dart';
import 'package:mr_news/core/utils/theme/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primary,
              ),
              child: Text(
                'News MR',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Home',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            leading: Icon(
              Icons.home,
              size: 28,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Spacer(
            flex: 3,
          ),
          Text(
            '❤️ Developed By Lbar Sidati',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
