class NewsArticle {
  final String uuid;
  final String title;
  final String description;
  final String imageUrl;
  final String publishedAt;
  final String url;
  final String source;

  NewsArticle({
    required this.uuid,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.publishedAt,
    required this.url,
    required this.source,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      uuid: json['uuid'] ?? '',
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      imageUrl: json['image_url'] ?? '',
      publishedAt: json['published_at'] ?? '',
      url: json['url'] ?? '',
      source: json['source'] ?? 'Unknown',
    );
  }
}
