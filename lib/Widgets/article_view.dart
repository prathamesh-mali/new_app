import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/screens/article_screen.dart';

import '../utils/constants.dart';

class ArticleView extends StatefulWidget {
  String? title;
  String? desc;
  String? content;
  String? url;
  String? urltoImage;

  ArticleView({
    super.key,
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
          padding: const EdgeInsets.all(8.0),
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
                width: size.width,
                child: Text(
                  widget.title!,
                  style: textStyle().titleText,
                ),
              ),
              SizedBox(
                height: 2.h,
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
