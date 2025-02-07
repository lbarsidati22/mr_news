import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_news/features/home/home_cubit/home_cubit.dart';
import 'package:mr_news/features/home/widgets/carousel_item_widget.dart';
import 'package:mr_news/features/home/widgets/title_headline_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getTopHeadlines(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home page'),
        ),
        body: Builder(builder: (context) {
          final homeCubit = BlocProvider.of<HomeCubit>(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                TitleHeadlineWidget(
                  title: 'Breaking News',
                  onTap: () {},
                ),
                //  CarouselItemWidget(),
                TitleHeadlineWidget(
                  title: 'Recommendation',
                  onTap: () {},
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
