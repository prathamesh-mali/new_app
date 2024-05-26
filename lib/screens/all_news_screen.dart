import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';

import '../Widgets/blog_tile.dart';

class ViewAllScreen extends StatefulWidget {
  final List articles;
  const ViewAllScreen({super.key, required this.articles});

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trending News",
          style: textStyle().appBarText,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.articles.length,
          itemBuilder: (context, index) {
            var article = widget.articles[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              child: Blogtile(
                title: article.title,
                desc: article.description,
                url: article.url,
                urltoImage: article.urltoImage,
              ),
            );
          },
        ),
      ),
    );
  }
}
