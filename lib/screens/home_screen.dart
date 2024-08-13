import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Widgets/blog_tile.dart';
import 'package:news_app/Widgets/category_tile.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/screens/bookmark_page.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/models/category_Model.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:news_app/services/news.dart';
import 'package:news_app/utils/constants.dart';

import 'all_news_screen.dart';
import 'category_screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];

  bool _isLoading = true;

  @override
  void initState() {
    categories = getCategories();
    getNews();
    super.initState();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();

    articles = newsClass.news;

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('News', style: textStyle().appBarText),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookmarkPage(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.bookmark),
            ),
          )
        ],
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(content: Text('Press back again to exit')),
        child: _isLoading
            ? const SpinKitThreeBounce(
                color: Color.fromRGBO(158, 158, 158, 1),
                size: 20,
              )
            : SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryView(
                                        name: categories[index].categoryName!),
                                  ));
                            },
                            child: CategoryTile(
                              image: categories[index].image,
                              categoryName: categories[index].categoryName,
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Trending News!",
                            style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ViewAllScreen(articles: articles),
                                ));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "View All",
                              style: GoogleFonts.poppins(
                                color: Colors.blue,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width,
                      height: size.height / 1.4,
                      child: RefreshIndicator(
                        color: Colors.blue,
                        onRefresh: () {
                          return getNews();
                        },
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount:
                              articles.length < 10 ? articles.length : 10,
                          itemBuilder: (context, index) {
                            var article = articles[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
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
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
