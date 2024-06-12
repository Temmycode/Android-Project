import 'package:apple_match/config/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 173.h),
            child: Image.asset(
              AppImages.onboarding1,
              height: 306.h,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 92.h),
            child: Image.asset(
              AppImages.onboarding2,
              height: 456.h,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
