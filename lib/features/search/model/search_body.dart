class SearchBody {
  final String q;
  final String searchIn;
  final int? pageSize;
  final int? page;

  SearchBody({
    required this.q,
    this.searchIn = 'title',
    this.pageSize = 15,
    this.page = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'q': q,
      'searchIn': searchIn,
      'pageSize': pageSize,
      'page': page,
    };
  }

  factory SearchBody.fromMap(Map<String, dynamic> map) {
    return SearchBody(
      q: map['q'] ?? '',
      searchIn: map['searchIn'] ?? '',
      pageSize: map['pageSize']?.toInt(),
      page: map['page']?.toInt(),
    );
  }
}
