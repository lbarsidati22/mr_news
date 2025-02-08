part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchResultLoaded extends SearchState {
  final List<Article>? articles;

  SearchResultLoaded(this.articles);
}

final class SearchResultLoading extends SearchState {}

final class SearchResultError extends SearchState {
  final String message;

  SearchResultError(this.message);
}
