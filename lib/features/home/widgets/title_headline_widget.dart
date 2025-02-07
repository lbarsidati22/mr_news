import 'package:flutter/material.dart';
import 'package:mr_news/core/utils/theme/app_colors.dart';

class TitleHeadlineWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const TitleHeadlineWidget(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            'View All',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        )
      ],
    );
  }
}
