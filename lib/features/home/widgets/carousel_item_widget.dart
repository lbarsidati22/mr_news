import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mr_news/core/model/news_api_response.dart';
import 'package:mr_news/core/utils/theme/app_colors.dart';

class CustomCarouselSlider extends StatefulWidget {
  final List<Article> articles;
  const CustomCarouselSlider({
    super.key,
    required this.articles,
  });

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _current = 0;
  final controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.articles.map((article) {
      final parsedDate =
          DateTime.parse(article.publishedAt ?? DateTime.now().toString());
      final publishedDate = DateFormat.yMMMd().format(parsedDate);
      return InkWell(
        onTap: () {},
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: article.urlToImage ??
                      'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
                  fit: BoxFit.cover,
                  width: 1000.0,
                  height: 280,
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${article.source?.name ?? ''}.$publishedDate',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          article.title ?? '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      );
    }).toList();
    return Column(children: [
      Expanded(
        child: CarouselSlider(
          items: imageSliders,
          carouselController: controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.articles.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => controller.animateToPage(entry.key),
            child: Container(
              width: _current == entry.key ? 25 : 12.0,
              height: 12.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  borderRadius:
                      _current == entry.key ? BorderRadius.circular(8) : null,
                  shape: _current == entry.key
                      ? BoxShape.rectangle
                      : BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : AppColors.primary)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
