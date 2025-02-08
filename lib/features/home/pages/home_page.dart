import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_news/core/utils/route/app_routes.dart';
import 'package:mr_news/core/views/widgets/app_bar_bottom.dart';
import 'package:mr_news/core/views/widgets/app_drawer.dart';
import 'package:mr_news/features/home/home_cubit/home_cubit.dart';
import 'package:mr_news/features/home/widgets/carousel_item_widget.dart';
import 'package:mr_news/features/home/widgets/recommended_item_widget.dart';
import 'package:mr_news/features/home/widgets/title_headline_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scafolldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getTopHeadlines()
        ..getRecommendedItems(),
      child: Scaffold(
        key: _scafolldKey,
        drawer: AppDrawer(),
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(8.0),
            child: AppBarBottom(
              iconData: Icons.menu,
              onTap: () {
                _scafolldKey.currentState!.openDrawer();
              },
            ),
          ),
          actions: [
            AppBarBottom(
              iconData: Icons.search,
              hasPadding: true,
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.searchPage,
                );
              },
            ),
            SizedBox(
              width: 10,
            ),
            AppBarBottom(
              iconData: Icons.share,
              hasPadding: true,
              onTap: () {},
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Builder(builder: (context) {
          final homeCubit = BlocProvider.of<HomeCubit>(context);
          final size = MediaQuery.sizeOf(context);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TitleHeadlineWidget(
                    title: 'Breaking News',
                    onTap: () {},
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    bloc: homeCubit,
                    buildWhen: (previous, current) =>
                        current is TopHeadlineError ||
                        current is TopHeadlineLoaded ||
                        current is TopHeadlineLoading,
                    builder: (context, state) {
                      if (state is TopHeadlineLoading) {
                        return Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      } else if (state is TopHeadlineLoaded) {
                        final articles = state.articles;
                        return SizedBox(
                          height: size.height * 0.3,
                          child: CustomCarouselSlider(
                            articles: articles ?? [],
                          ),
                        );
                      } else if (state is TopHeadlineError) {
                        return Center(
                          child: Text(state.message),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                  TitleHeadlineWidget(
                    title: 'Recommendation',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    bloc: homeCubit,
                    buildWhen: (previous, current) =>
                        current is RecommnendeLoaded ||
                        current is RecommnendeError ||
                        current is RecommnendeLoading,
                    builder: (context, state) {
                      if (state is RecommnendeError) {
                        return Text(state.message);
                      } else if (state is RecommnendeLoading) {
                        return Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      } else if (state is RecommnendeLoaded) {
                        return RecommendedItemWidget(
                          articles: state.articles ?? [],
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
