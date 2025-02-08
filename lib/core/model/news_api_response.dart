class NewsApiResponse {
  final String status;
  final int totalResults;
  final List<Article>? articles;

  NewsApiResponse({
    required this.status,
    required this.totalResults,
    this.articles,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles?.map((x) => x.toMap()).toList(),
    };
  }

  factory NewsApiResponse.fromMap(Map<String, dynamic> map) {
    return NewsApiResponse(
      status: map['status'] ?? '',
      totalResults: map['totalResults']?.toInt() ?? 0,
      articles: map['articles'] != null
          ? List<Article>.from(map['articles']?.map((x) => Article.fromMap(x)))
          : null,
    );
  }
}

class Article {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Map<String, dynamic> toMap() {
    return {
      'source': source?.toMap(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      source: map['source'] != null ? Source.fromMap(map['source']) : null,
      author: map['author'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
      urlToImage: map['urlToImage'],
      publishedAt: map['publishedAt'],
      content: map['content'],
    );
  }
}

class Source {
  final String? id;
  final String? name;

  const Source(
    this.id,
    this.name,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      map['id'],
      map['name'],
    );
  }
}
