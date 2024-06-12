import 'package:apple_match/config/colors/app_colors.dart';
import 'package:apple_match/features/auth/widgets/auth_text_field.dart';
import 'package:apple_match/shared/enums/text_field_state.dart';
import 'package:apple_match/shared/widgets/back_button.dart';
import 'package:apple_match/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String route = '/forgot-password';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneNumberController.dispose();
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
                padding: EdgeInsets.only(top: 239.h, left: 24.w, right: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 38.spMin,
                        fontWeight: FontWeight.w600,
                        color: AppColors.pink500,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    AuthTextField(
                      controller: _phoneNumberController,
                      state: TextFieldState.phone,
                      hintText: "Enter Your Phonr Number",
                      icon: "icon",
                    ),
                    SizedBox(height: 40.h),
                    const PrimaryButton(text: "Send Verification")
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
