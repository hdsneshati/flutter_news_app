class NewsResponse {
  final Map<String, List<NewsArticle>> data;

  NewsResponse({
    required this.data,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    final dataMap = <String, List<NewsArticle>>{};
    final dataJson = json['data'] as Map<String, dynamic>;

    dataJson.forEach((key, value) {
      final list = (value as List)
          .map((item) => NewsArticle.fromJson(item))
          .toList();
      dataMap[key] = list;
    });

    return NewsResponse(data: dataMap);
  }
}

class NewsArticle {
  final String? uuid;
  final String? title;
  final String? description;
  final String? keywords;
  final String? snippet;
  final String? url;
  final String? imageUrl;
  final String? language;
  final String? publishedAt;
  final String? source;
  final List<String>? categories;
  final String? locale;
  final List<NewsArticle>? similar;

  NewsArticle({
    this.uuid,
    this.title,
    this.description,
    this.keywords,
    this.snippet,
    this.url,
    this.imageUrl,
    this.language,
    this.publishedAt,
    this.source,
    this.categories,
    this.locale,
    this.similar,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      uuid: json['uuid'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      keywords: json['keywords'] as String?,
      snippet: json['snippet'] as String?,
      url: json['url'] as String?,
      imageUrl: json['image_url'] as String?,
      language: json['language'] as String?,
      publishedAt: json['published_at'] as String?,
      source: json['source'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      locale: json['locale'] as String?,
      similar: (json['similar'] as List<dynamic>?)
          ?.map((e) => NewsArticle.fromJson(e))
          .toList(),
    );
  }
}
