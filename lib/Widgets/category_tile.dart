import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/constants.dart';

class CategoryTile extends StatelessWidget {
  final image, categoryName;

  const CategoryTile({
    required this.image,
    required this.categoryName,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              image,
              width: 150.w,
              height: 70.h,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 150.w,
            height: 70.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors().tileColor,
            ),
            child: Center(
              child: Text(
                categoryName,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
