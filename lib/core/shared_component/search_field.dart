import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khatibalamyfluttertask/core/config/color/app_colors.dart';

class AppSearchField extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final Function(String)? onChanged;
  final Function()? onTap;
  final int maxLength;
  final bool readOnly;
  final String hint;

  AppSearchField({
    super.key,
    this.onChanged,
    required this.hint,
    this.onTap,
    this.maxLength = 500,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: AppColors.grey),
          hintText: hint,
          counterText: "",
        ),
        onChanged: onChanged,
        onTap: onTap,
        textInputAction: TextInputAction.search,
        maxLength: maxLength,
        readOnly: readOnly,
      ),
    );
  }
}
