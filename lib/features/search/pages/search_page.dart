import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_news/core/views/widgets/article_widget_item.dart';
import 'package:mr_news/features/search/search_cubit/search_cubit.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchCubit>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search for title',
                suffixIcon: BlocBuilder<SearchCubit, SearchState>(
                  bloc: searchCubit,
                  buildWhen: (previous, current) =>
                      current is SearchResultError ||
                      current is SearchResultLoaded ||
                      current is SearchResultLoading,
                  builder: (context, state) {
                    if (state is SearchResultLoading) {
                      return IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.search,
                        ),
                      );
                    }
                    return IconButton(
                      onPressed: () async {
                        if (searchController.text.isNotEmpty) {
                          await searchCubit.search(searchController.text);
                        }
                      },
                      icon: Icon(
                        Icons.search,
                      ),
                    );
                  },
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            BlocBuilder<SearchCubit, SearchState>(
              bloc: searchCubit,
              buildWhen: (previous, current) =>
                  current is SearchResultError ||
                  current is SearchResultLoaded ||
                  current is SearchResultLoading,
              builder: (context, state) {
                if (state is SearchResultLoading) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is SearchResultError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is SearchResultLoaded) {
                  final articles = state.articles;
                  return articles == null
                      ? Center(
                          child: Text('No articles Found'),
                        )
                      : Expanded(
                          child: ListView.separated(
                            itemCount: articles.length,
                            itemBuilder: (context, index) {
                              final article = articles[index];

                              return ArticleWidgetItem(
                                article: article,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 15,
                              );
                            },
                          ),
                        );
                }
                return Center(
                  child: Text('Search for articls'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
