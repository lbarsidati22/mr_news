import 'package:flutter/material.dart';
import 'package:mr_news/core/model/news_api_response.dart';
import 'package:mr_news/core/views/widgets/article_widget_item.dart';

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
        return ArticleWidgetItem(article: article);
      },
    );
  }
}
