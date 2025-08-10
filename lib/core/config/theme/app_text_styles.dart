import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/app_colors.dart';

abstract class AppTextStyles {
  static final TextStyle titleStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.secondary,
  );

  static final TextStyle descriptionStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
  );

  static final TextStyle dateTimeStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static final TextStyle placeHolderStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
  );
}
