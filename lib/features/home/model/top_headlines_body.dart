class TopHeadlinesBody {
  final String country;
  final String? category;
  final String? sources;
  final String? q;
  final int? page;
  final int? pageSize;

  TopHeadlinesBody({
    this.country = 'us',
    this.category,
    this.sources,
    this.q,
    this.page,
    this.pageSize,
  });

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'category': category,
      'sources': sources,
      'q': q,
      'page': page,
      'pageSize': pageSize,
    };
  }

  factory TopHeadlinesBody.fromMap(Map<String, dynamic> map) {
    return TopHeadlinesBody(
      country: map['country'] ?? '',
      category: map['category'],
      sources: map['sources'],
      q: map['q'],
      page: map['page']?.toInt(),
      pageSize: map['pageSize']?.toInt(),
    );
  }
}
