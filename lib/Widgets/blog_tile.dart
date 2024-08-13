// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screens/article_screen.dart';
import 'package:news_app/utils/constants.dart';

class Blogtile extends StatefulWidget {
  String? title;
  String? desc;
  String? url;
  String? urltoImage;

  Blogtile({
    Key? key,
    required this.title,
    required this.desc,
    required this.url,
    required this.urltoImage,
  }) : super(key: key);

  @override
  State<Blogtile> createState() => _BlogtileState();
}

class _BlogtileState extends State<Blogtile> {
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
        elevation: 3,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: widget.urltoImage!,
                    width: 150.w,
                    height: 100.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Column(
                children: [
                  SizedBox(
                    width: size.width * 0.6,
                    child: Text(
                      widget.title!,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.6,
                    child: Text(
                      widget.desc!,
                      maxLines: 3,
                      overflow: TextOverflow.clip,
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        color: AppColors().descColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
