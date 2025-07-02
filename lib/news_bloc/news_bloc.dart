import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/news_bloc/news_event.dart';
import 'package:flutter_news_app/news_bloc/news_state.dart';
import 'package:flutter_news_app/services/news_api_service.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsApiService apiService;

  NewsBloc(this.apiService) : super(NewsInitial()) {
    on<FetchNews>(_onFetchNews);
  }

  Future<void> _onFetchNews(FetchNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());  // وضعیت در حال بارگذاری

    try {
      final articles = await apiService.fetchTopNews();  // گرفتن داده‌ها
      emit(NewsSuccess(articles));  // وضعیت موفقیت
    } catch (e) {
      emit(NewsError(e.toString()));  // وضعیت خطا
    }
  }
}
