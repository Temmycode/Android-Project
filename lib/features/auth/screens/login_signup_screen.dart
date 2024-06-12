import 'package:apple_match/config/colors/app_colors.dart';
import 'package:apple_match/features/auth/screens/login_screen.dart';
import 'package:apple_match/features/auth/screens/signup_screen.dart';
import 'package:apple_match/features/auth/widgets/third_party_auth_button.dart';
import 'package:apple_match/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginSignupScreen extends StatelessWidget {
  static const String route = "login-signup";
  const LoginSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 52.h),
          child: Column(
            children: [
              const Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    "Apple Match",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 44.spMin,
                      color: AppColors.pink500,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -44.h),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 219.h,
                      width: 199.w,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                  top: 46.h,
                ),
                child: Column(
                  children: [
                    PrimaryButton(
                        onTap: () {
                          Navigator.pushNamed(context, LoginScreen.route);
                        },
                        text: "Log In"),
                    SizedBox(height: 40.h),
                    PrimaryButton(
                      onTap: () {
                        Navigator.pushNamed(context, SignupScreen.route);
                      },
                      text: "Sign Up",
                      isOutline: true,
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: AppColors.grey200,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(
                            "Or",
                            style: TextStyle(
                              fontSize: 16.spMin,
                              color: AppColors.grey700,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: AppColors.grey200,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 40.h),
                    ThirdPartyAuthButton(
                      isGoogle: true,
                      onTap: () {},
                    ),
                    SizedBox(height: 20.h),
                    ThirdPartyAuthButton(
                      isGoogle: false,
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
