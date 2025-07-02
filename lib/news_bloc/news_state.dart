import 'package:flutter_news_app/models/news_model.dart';

abstract class NewsState {
  const NewsState();
}

class NewsInitial extends NewsState{}
class NewsLoading extends NewsState{}
class NewsSuccess extends NewsState{
  final List<NewsArticle> article;
  NewsSuccess(this.article);
}
class NewsError extends NewsState{

  final String message;
  NewsError(this.message);
}