import 'package:dio/dio.dart';
import 'package:flutter_news_app/models/news_model.dart';
import '../models/news_model.dart';

class NewsApiService {
  static const String baseUrl = "https://api.thenewsapi.com/v1";

  final Dio _dio;
  final String apiToken;

  NewsApiService({required this.apiToken, Dio? dio})
      : _dio = dio ?? Dio(BaseOptions(baseUrl: baseUrl));//گر Dio داده نشه، خودش یک Dio جدید می‌سازه و baseUrl رو براش تنظیم می‌کنه

  Future<List<NewsArticle>> fetchTopNews({//ک لیست از اخبار رو به صورت Future برمی‌گردونه.
    String locale = 'us',
    int limit = 10,//10 خبر دریافت میکنه
  }) async {
    try {//ارسال درخواست
      final response = await _dio.get(
        '/news/top',
        queryParameters: {
          'api_token': apiToken,
          'locale': locale,
          'limit': limit,
        },
      );

      if (response.statusCode == 200) {//کد200یعنی موفق
        final data = response.data;
        List<dynamic> articlesJson = data['data'];
        List<NewsArticle> articles =
            articlesJson.map((json) => NewsArticle.fromJson(json)).toList();
        return articles;
      } else {
        throw Exception('Failed to load news, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load news: $e');
    }
  }
}
