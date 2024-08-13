import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Controller/bookmark_controller.dart';
import 'package:news_app/screens/article_screen.dart';

import '../utils/constants.dart';

// ignore: must_be_immutable
class ArticleView extends StatefulWidget {
  dynamic article;
  String? title;
  String? desc;
  String? content;
  String? url;
  String? urltoImage;

  ArticleView({
    super.key,
    required this.article,
    required this.title,
    required this.desc,
    required this.url,
    required this.content,
    required this.urltoImage,
  });

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  Bookmarkcontroller bookmark = Bookmarkcontroller();
  bool _bookmarkAdded = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticlePage(articleUrl: widget.url!),
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
                  imageUrl: widget.urltoImage!,
                  fit: BoxFit.cover,
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
                      widget.title!,
                      style: textStyle().titleText,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        _bookmarkAdded
                            ? bookmark.removeBookmark(widget.article)
                            : bookmark.addBookmark(widget.article);
                        setState(() {
                          _bookmarkAdded = !_bookmarkAdded;
                          print("bookmarkAdded  from setstate");
                          print(_bookmarkAdded);
                        });
                        print("bookmarkAdded  as whole");
                        print(_bookmarkAdded);
                      },
                      child: _bookmarkAdded
                          ? const Icon(Icons.bookmark_added_outlined)
                          : const Icon(Icons.bookmark_outline))
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                width: size.width,
                child: Text(
                  widget.desc!,
                  style: textStyle().descText,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
