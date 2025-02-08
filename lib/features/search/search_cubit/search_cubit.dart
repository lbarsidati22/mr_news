import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_news/core/model/news_api_response.dart';
import 'package:mr_news/features/search/model/search_body.dart';
import 'package:mr_news/features/search/services/search_services.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  final searchServices = SearchServices();
  Future<void> search(String keyword) async {
    emit(SearchResultLoading());
    try {
      final body = SearchBody(q: keyword);
      final response = await searchServices.search(body);
      emit(
        SearchResultLoaded(
          response.articles,
        ),
      );
    } catch (e) {
      emit(SearchResultError(e.toString()));
      print(e.toString());
    }
  }
}
