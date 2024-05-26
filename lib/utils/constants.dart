import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class textStyle {
  TextStyle appBarText = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
  );

  TextStyle titleText = GoogleFonts.poppins(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
  );

  TextStyle descText = GoogleFonts.poppins(
    fontSize: 12.sp,
    color: const Color(0xFF4E4E4E),
    fontWeight: FontWeight.w400,
  );
}

class AppColors {
  Color descColor = const Color(0xFF4E4E4E);
  Color tileColor = const Color(0x531A1A1A);
}
