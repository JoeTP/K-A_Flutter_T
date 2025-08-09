import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khatibalamyfluttertask/core/config/color/app_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors.base,
    inputDecorationTheme: DefaultInputDecoration(),
    appBarTheme: DefaultAppBarTheme(),
  );
}

class DefaultAppBarTheme extends AppBarTheme {
  DefaultAppBarTheme()
    : super(
        backgroundColor: AppColors.gold,
        titleTextStyle: TextStyle(
          fontSize: 18.sp,
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      );
}

class DefaultInputDecoration extends InputDecorationTheme {
  static final OutlineInputBorder defaultBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(100),
    borderSide: BorderSide(color: AppColors.base, width: 2),
  );

  static final OutlineInputBorder unFocusedBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(100),
    borderSide: BorderSide(color: AppColors.lightBase, width: 2),
  );

  DefaultInputDecoration()
    : super(
        border: unFocusedBorderStyle,
        focusedBorder: defaultBorderStyle,
        enabledBorder: unFocusedBorderStyle,
        hintStyle: TextStyle(color: AppColors.grey),
      );
}
