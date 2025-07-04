
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_news_app/Screens/news_details_screen.dart';
import 'package:flutter_news_app/models/news_model.dart';
import 'package:flutter_news_app/news_bloc/news_bloc.dart';
import 'package:flutter_news_app/news_bloc/news_event.dart';
import 'package:flutter_news_app/news_bloc/news_state.dart';
//


class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if(state is NewsInitial){
            return Center(
               child: Column(
                children: [
                  ElevatedButton(
                          onPressed:(){
                             context.read<NewsBloc>().add(FetchNews());//درخواست دوباره لود کردن
                          }, 
                          child: const Text('لود کردن اخبار')
                  ),
                ],
              ),
            );             
          }
         else if(state is NewsLoading){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if(state is NewsSuccess){
            final List<NewsArticle> articles = state.article;
            return RefreshIndicator(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context,index){
                  final article = articles[index];

                  //ایتم هر خبر
                return ListTile(
                   leading: CachedNetworkImage(
                    imageUrl: article.imageUrl ?? 'عکس نداره',
                      width: 80,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const SizedBox(
                        width: 80,
                        height: 60,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  title:Text(article.title ?? 'بدون عنوان'),
                   subtitle: Text(
                      article.description ?? 'بدون متن',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                   /* onTap: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => NewsDetailsScreen(article: article),
                       ),
                      );

                    },*/
                );
                
                }
                ),
              onRefresh: () async {
                 context.read<NewsBloc>().add(FetchNews());
              },
              );
          }
          else if(state is NewsError){
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.message),
                        const SizedBox(height: 12,),
                        ElevatedButton(
                          onPressed:(){
                             context.read<NewsBloc>().add(FetchNews());//درخواست دوباره لود کردن
                          }, 
                          child: const Text('تلاش مجدد')
                          ),
                      ],
                    ),
                  );
          }
          else{
             return const Center(child: Text('وضعیت نامشخص'),);
          }
         
        },
      ),
    );
  }
}