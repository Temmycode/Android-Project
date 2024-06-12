import 'package:apple_match/config/colors/app_colors.dart';
import 'package:apple_match/config/constants/looking_for_constants.dart';
import 'package:apple_match/features/payment/screens/payment_wall_screen.dart';
import 'package:apple_match/features/survey/providers/looking_for_provider.dart';
import 'package:apple_match/features/survey/widgets/options.dart';
import 'package:apple_match/shared/extensions/alignment.dart';
import 'package:apple_match/shared/widgets/back_button.dart';
import 'package:apple_match/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LookingForScreen extends ConsumerWidget {
  static const String route = '/looking-for';
  const LookingForScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lookingFor = ref.watch(lookingForProvider);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFFD9D9D9).withOpacity(0.0),
                  const Color(0xFFFFDEE9)
                ],
              ),
            ),
          ),

          // ! body
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 66.h, left: 16.w, right: 16.w),
              child: Column(
                children: [
                  Text(
                    "I Am Looking For...",
                    style: TextStyle(
                      color: AppColors.pink500,
                      fontSize: 32.spMin,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Text(
                    "Provide us with further insights into your\n preferences",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.grey700,
                      fontSize: 17.spMin,
                    ),
                  ),
                  SizedBox(height: 139.h),
                  Column(
                    children: List.generate(
                      lookingForConstants.length,
                      // TODO: change the implementation for this
                      (index) => Options(
                        isSelected: lookingFor == lookingForConstants[index],
                        text: lookingForConstants[index],
                        onTap: () async {
                          await HapticFeedback.lightImpact().whenComplete(() =>
                              ref.read(lookingForProvider.notifier).state =
                                  lookingForConstants[index]);
                        },
                      ),
                    ).toList(),
                  )
                ],
              ),
            ).center(),
          ),

          // ! back button
          Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: const SafeArea(child: AppBackButton(isCircular: true)),
          ),

          // ! continue button
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            child: SafeArea(
              top: false,
              child: PrimaryButton(
                text: "Continue",
                borderRadius: 50,
                onTap: () {
                  Navigator.pushNamed(context, PaymentWallScreen.route);
                },
              ).bottom(),
            ),
          ),
        ],
      ),
    );
  }
}
