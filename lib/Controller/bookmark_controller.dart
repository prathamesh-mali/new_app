import 'package:flutter/foundation.dart';

import 'package:news_app/models/show_category.dart';

class Bookmarkcontroller {
  List<showCategoryModel> bookMarkedNews = [];
  Bookmarkcontroller({Key? key});

  void addBookmark(index) {
    bookMarkedNews.add(index);
    if (kDebugMode) {
      print("added to bookmarks");
      print(bookMarkedNews.length);
    }
  }

  void removeBookmark(index) {
    bookMarkedNews.remove(index);
    if (kDebugMode) {
      print("removed from bookmarks");
      print(bookMarkedNews.length);
    }
  }
}
