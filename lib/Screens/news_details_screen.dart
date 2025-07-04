











/*import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_news_app/models/news_model.dart';


class NewsDetailsScreen extends StatelessWidget {
  final NewsArticle article; 
  const NewsDetailsScreen({
    super.key,
    required this.article,
    });

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text(article.title ?? 'بدون عنوان'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // عکس خبر
            CachedNetworkImage(
              imageUrl: article.imageUrl ?? '',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              placeholder: (context, url) => const SizedBox(
                width: double.infinity,
                height: 200,
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey[300],
                child: const Center(child: Icon(Icons.error)),
              ),
            ),
            const SizedBox(height: 16),
            // عنوان خبر
            Text(
              article.title ?? 'بدون عنوان',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // توضیحات
            Text(
              article.description ?? 'بدون متن',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // متن کامل یا متن اضافه
            Text(
              article.title ?? 'متن کامل موجود نیست',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}*/