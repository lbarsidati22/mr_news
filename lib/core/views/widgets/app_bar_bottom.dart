import 'package:flutter/material.dart';
import 'package:mr_news/core/utils/theme/app_colors.dart';

class AppBarBottom extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconData;
  final bool hasPadding;
  const AppBarBottom({
    super.key,
    required this.iconData,
    required this.onTap,
    this.hasPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.grey9,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.all(hasPadding ? 8.0 : 0),
          child: Icon(iconData),
        ),
      ),
    );
  }
}
