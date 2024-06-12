import 'package:apple_match/config/colors/app_colors.dart';
import 'package:apple_match/features/auth/screens/verification_container.dart';
import 'package:apple_match/shared/extensions/alignment.dart';
import 'package:apple_match/shared/widgets/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationScreen extends StatelessWidget {
  static const String route = '/verification';
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              decoration: const BoxDecoration(color: AppColors.pink50),
            ),
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 39.w),
                  child: const VerificationContainer(),
                ).center(),
              ),
            ),

            // ! Back Button
            SafeArea(
              minimum: EdgeInsets.only(left: 30.w),
              child: const AppBackButton().animate(delay: 150.ms).flip(),
            ),
          ],
        ),
      ),
    );
  }
}
