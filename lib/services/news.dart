import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/secrets.dart';

class News {
  Dio dio = Dio();
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    try {
      String trendingNewsUrl =
          "https://newsapi.org/v2/everything?q=tesla&sortBy=publishedAt&lan=en&apiKey=$apiKey";

      var response = await dio.get(trendingNewsUrl);

      var jsonData = response.data;

      if (jsonData['status'] == 'ok') {
        jsonData['articles'].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urltoImage: element['urlToImage'],
            );

            news.add(articleModel);
          }
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
