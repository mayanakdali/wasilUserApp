import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/colors.dart';

final TextStyle basicPrimary = GoogleFonts.openSans(
  fontSize: 15,
  color: AppColors.primaryColor,
);
final TextStyle boldPrimary = GoogleFonts.openSans(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: AppColors.primaryColor,
);

final TextStyle basicSecondry = GoogleFonts.openSans(
  fontSize: 15,
  color: AppColors.secondaryColor,
);

final TextStyle proSecondry = GoogleFonts.openSans(
  fontSize: 13,
  color: AppColors.secondaryColor,
);
final TextStyle proSecondrybold = GoogleFonts.openSans(
  fontSize: 13,
  color: AppColors.secondaryColor,
  fontWeight: FontWeight.bold,
);

final TextStyle boldSecondry = GoogleFonts.openSans(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: AppColors.secondaryColor,
);

final TextStyle greybasic = GoogleFonts.openSans(
  color: Colors.grey[500],
  fontSize: 18.0,
);

final TextStyle greysmall = GoogleFonts.openSans(
  color: Colors.grey[500],
  fontSize: 13.0,
);

final TextStyle whitebasic = GoogleFonts.openSans(
  color: Colors.white,
  fontSize: 11.0.sp,
);
