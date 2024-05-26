import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/models/show_category.dart';
import 'package:news_app/services/secrets.dart';

class showCategoryNews {
  Dio dio = Dio();
  List<showCategoryModel> categories = [];

  Future<void> getCategories(String category) async {
    try {
      String url =
          "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$apiKey";

      var response = await dio.get(url);

      var jsonData = response.data;

      if (jsonData['status'] == 'ok') {
        jsonData['articles'].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            showCategoryModel showcategoryModel = showCategoryModel(
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urltoImage: element['urlToImage'],
              content: element['content'],
            );

            categories.add(showcategoryModel);
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
