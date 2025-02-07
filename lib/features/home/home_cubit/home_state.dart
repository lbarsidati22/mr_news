part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class TopHeadlineLoaded extends HomeState {
  final List<Article>? articles;

  TopHeadlineLoaded(
    this.articles,
  );
}

final class TopHeadlineLoading extends HomeState {}

final class TopHeadlineError extends HomeState {
  final String message;

  TopHeadlineError(this.message);
}
