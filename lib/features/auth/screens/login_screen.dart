import 'package:apple_match/config/colors/app_colors.dart';
import 'package:apple_match/config/icons/app_icons.dart';
import 'package:apple_match/features/auth/widgets/auth_text_field.dart';
import 'package:apple_match/features/auth/widgets/third_party_auth_button.dart';
import 'package:apple_match/shared/enums/text_field_state.dart';
import 'package:apple_match/shared/extensions/alignment.dart';
import 'package:apple_match/shared/widgets/back_button.dart';
import 'package:apple_match/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  static const String route = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = true;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.pink50,
                  AppColors.pink50,
                  Colors.white,
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 66.h),
                child: Column(
                  children: [
                    Text(
                      "Login Your\nAccount",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 38.spMin,
                        color: AppColors.pink500,
                      ),
                    ).left().animate(delay: 120.ms).fadeIn(),
                    SizedBox(height: 13.h),
                    AuthTextField(
                      controller: _emailController,
                      state: TextFieldState.email,
                      hintText: "Enter Your Email",
                      icon: AppIcons.emailIcon,
                    ),
                    SizedBox(height: 16.h),
                    AuthTextField(
                      controller: _passwordController,
                      state: TextFieldState.password,
                      hintText: "Password",
                      icon: AppIcons.lockIcon,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox.adaptive(
                              activeColor: AppColors.green200,
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() => rememberMe = value!);
                              },
                            ),
                            Text(
                              "Remember me",
                              style: TextStyle(
                                color: AppColors.black100,
                                fontSize: 12.spMin,
                              ),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                              color: AppColors.grey700,
                              fontSize: 12.spMin,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 40.h,
                      ),
                      child: Column(
                        children: [
                          const PrimaryButton(text: "Log In"),
                          SizedBox(height: 28.h),
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
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don’t have an account? ",
                                style: TextStyle(
                                  color: AppColors.grey700,
                                  fontSize: 14.spMin,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    color: AppColors.blue,
                                    fontSize: 14.spMin,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          // ! Back Button
          SafeArea(
            minimum: EdgeInsets.only(left: 30.w),
            child: const AppBackButton(),
          ),
        ],
      ),
    );
  }
}
