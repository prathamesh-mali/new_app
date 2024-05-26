import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/show_category.dart';

import '../Widgets/article_view.dart';
import '../services/showcategories.dart';

class CategoryView extends StatefulWidget {
  final String name;
  const CategoryView({super.key, required this.name});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<showCategoryModel> categories = [];

  bool _isLoading = true;

  @override
  void initState() {
    getCategoriesNews();

    super.initState();
  }

  getCategoriesNews() async {
    showCategoryNews categoryClass = showCategoryNews();
    await categoryClass.getCategories(widget.name.toLowerCase());
    categories = categoryClass.categories;

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height / 1,
        child: RefreshIndicator(
          color: Colors.blue,
          onRefresh: () {
            return getCategoriesNews();
          },
          child: _isLoading
              ? const SpinKitThreeBounce(
                  color: Colors.grey,
                  size: 20,
                )
              : categories.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline_outlined,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Please try again, Your news will be available shortly.",
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                            ),
                          )
                        ],
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        var article = categories[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 8,
                          ),
                          child: ArticleView(
                            title: article.title,
                            desc: article.description,
                            url: article.url,
                            content: article.content,
                            urltoImage: article.urltoImage,
                          ),
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
