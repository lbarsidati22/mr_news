import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_news/core/model/news_api_response.dart';
import 'package:mr_news/features/home/model/top_headlines_body.dart';
import 'package:mr_news/features/home/services/home_services.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final homeServices = HomeServices();
  Future<void> getTopHeadlines() async {
    emit(TopHeadlineLoading());
    try {
      final body = TopHeadlinesBody(
        category: 'business',
        page: 1,
        pageSize: 8,
      );
      final result = await homeServices.getTopHeadlines(body);
      print('your article is ${result.articles}');
      emit(TopHeadlineLoaded(result.articles));
    } catch (e) {
      emit(TopHeadlineError(e.toString()));
    }
  }

  Future<void> getRecommendedItems() async {
    emit(RecommnendeLoading());
    try {
      final body = TopHeadlinesBody(
        page: 1,
        pageSize: 15,
      );
      final result = await homeServices.getTopHeadlines(body);
      emit(RecommnendeLoaded(result.articles));
    } catch (e) {
      emit(
        RecommnendeError(
          e.toString(),
        ),
      );
    }
  }
}
