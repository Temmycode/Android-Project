import 'package:apple_match/config/colors/app_colors.dart';
import 'package:apple_match/config/icons/app_icons.dart';
import 'package:apple_match/features/survey/screens/take_photo_screen.dart';
import 'package:apple_match/shared/extensions/alignment.dart';
import 'package:apple_match/shared/widgets/back_button.dart';
import 'package:apple_match/shared/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';

class PhotoVerificationScreen extends StatelessWidget {
  static const String route = '/photo-verification';
  const PhotoVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 66.h),
              child: Column(
                children: [
                  Text(
                    "Add Photo",
                    style: TextStyle(
                      color: AppColors.pink500,
                      fontSize: 32.spMin,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  SizedBox(
                    width: 380.w,
                    height: 72.h,
                    child: Text(
                      "Add your photo for security purposes. Your photo will be used so that we can identify you. this photo won’t be displayed to the public.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.grey700,
                        fontSize: 16.spMin,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ).center(),
          Container(
            padding: EdgeInsets.all(104.7.h),
            height: 300.h,
            width: 300.h,
            decoration: BoxDecoration(
              color: AppColors.pink200,
              borderRadius: BorderRadius.circular(300.r),
            ),
            child: SvgPicture.asset(AppIcons.userSocial),
          ).center(),
          Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: const SafeArea(child: AppBackButton(isCircular: true)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            child: SafeArea(
              top: false,
              child: PrimaryButton(
                onTap: () async {
                  PermissionStatus status = await Permission.camera.status;

                  // if (status == PermissionStatus.granted) {
                  Navigator.pushNamed(context, TakePhotoScreen.route);
                  // }
                },
                text: "Confirm",
              ).bottom(),
            ),
          ),
        ],
      ),
    );
  }
}
