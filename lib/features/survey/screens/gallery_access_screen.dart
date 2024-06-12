import 'package:apple_match/config/colors/app_colors.dart';
import 'package:apple_match/config/images/app_images.dart';
import 'package:apple_match/shared/extensions/alignment.dart';
import 'package:apple_match/shared/widgets/back_button.dart';
import 'package:apple_match/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GalleryAccessScreen extends StatelessWidget {
  static const String route = '/galleryaccess';
  const GalleryAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 66.h, left: 24.w, right: 24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppImages.galleryAccess),
                  SizedBox(height: 45.h),
                  Text(
                    "Activate access to gallery",
                    style: TextStyle(
                      color: AppColors.pink500,
                      fontSize: 29.spMin,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    width: 380.w,
                    height: 72.h,
                    child: Text(
                      "You can use photos from your gallery to upload personal photos and documents for verification of your profile",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.grey700,
                        fontSize: 16.spMin,
                      ),
                    ),
                  ),
                  SizedBox(height: 61.h),
                  PrimaryButton(
                    text: "Next",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ).center(),
          Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: const SafeArea(child: AppBackButton(isCircular: true)),
          ),
        ],
      ),
    );
  }
}
