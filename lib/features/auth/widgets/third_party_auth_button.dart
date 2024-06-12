import 'package:apple_match/config/colors/app_colors.dart';
import 'package:apple_match/config/icons/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ThirdPartyAuthButton extends StatelessWidget {
  final bool isGoogle;
  final VoidCallback? onTap;

  const ThirdPartyAuthButton({
    super.key,
    required this.isGoogle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
          border: Border.all(color: AppColors.grey100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(isGoogle ? AppIcons.google : AppIcons.facebook),
            SizedBox(width: 8.w),
            Text(
              "Continue with ${isGoogle ? "Google" : "Facebook"}",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.spMin,
                color: AppColors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
