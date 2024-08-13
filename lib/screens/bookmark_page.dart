import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news_app/Controller/bookmark_controller.dart';
import 'package:news_app/screens/article_screen.dart';
import 'package:news_app/utils/constants.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    Bookmarkcontroller bookmark = Bookmarkcontroller();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bookmarks",
          style: textStyle().appBarText,
        ),
      ),
      body: Column(
        children: [
          Text("${bookmark.bookMarkedNews.length}"),
          SizedBox(
            height: size.height / 2,
            child: ListView.builder(
              itemCount: bookmark.bookMarkedNews.length,
              itemBuilder: (context, index) {
                dynamic bookmarkedarticle = bookmark.bookMarkedNews[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ArticlePage(articleUrl: bookmarkedarticle.url!),
                        ));
                  },
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(15),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              imageUrl: bookmarkedarticle.urltoImage!,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width * 0.8,
                                child: Text(
                                  bookmarkedarticle.title!,
                                  style: textStyle().titleText,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          SizedBox(
                            width: size.width,
                            child: Text(
                              bookmarkedarticle.desc!,
                              style: textStyle().descText,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
