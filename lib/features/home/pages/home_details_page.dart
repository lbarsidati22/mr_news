import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mr_news/core/model/news_api_response.dart';
import 'package:mr_news/core/utils/theme/app_colors.dart';
import 'package:mr_news/core/views/widgets/app_bar_bottom.dart';

class HomeDetailsPage extends StatelessWidget {
  final Article article;
  const HomeDetailsPage({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final parsedDate = DateTime.parse(article.publishedAt.toString());
    final publishedDate = DateFormat.yMMMMd().format(parsedDate);
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: Stack(
        children: [
          CachedNetworkImage(
            fit: BoxFit.cover,
            height: size.height * 0.55,
            imageUrl: article.urlToImage ??
                'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.center,
                begin: Alignment.bottomCenter,
                colors: [
                  AppColors.black,
                  AppColors.black3,
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.06,
            right: 8,
            left: 8,
            child: SizedBox(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBarBottom(
                    hasPadding: true,
                    iconData: Icons.arrow_back,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Row(
                    children: [
                      AppBarBottom(
                        hasPadding: true,
                        iconData: Icons.favorite_border,
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      AppBarBottom(
                        hasPadding: true,
                        iconData: Icons.more_vert,
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.3,
                  right: 16,
                  bottom: 16,
                  left: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'General',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      maxLines: 2,
                      article.title ?? '',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      publishedDate,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.grey4,
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        // Text(article.title ?? ''),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: CachedNetworkImageProvider(
                                article.urlToImage ??
                                    'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              article.source!.name ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          article.description ?? '',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColors.black,
                                  ),
                        ),
                        Text(
                          article.content ?? '',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColors.black,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
