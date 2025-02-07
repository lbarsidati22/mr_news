import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mr_news/core/model/news_api_response.dart';
import 'package:mr_news/core/utils/theme/app_colors.dart';

class RecommendedItemWidget extends StatelessWidget {
  final List<Article> articles;
  const RecommendedItemWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          final paredDate = DateTime.parse(article.publishedAt.toString());
          final publishedDate = DateFormat.yMMMd().format(paredDate);
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: 150,
                  width: 170,
                  imageUrl: article.urlToImage ??
                      'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  spacing: 15,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          publishedDate,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          article.title ?? '',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: AppColors.white,
                                  ),
                        ),
                      ],
                    ),
                    Text(
                      article.source!.name ?? '',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }
}
