import 'package:apple_match/config/colors/app_colors.dart';
import 'package:apple_match/config/icons/app_icons.dart';
import 'package:apple_match/shared/enums/text_field_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AuthTextField extends StatefulWidget {
  final TextFieldState state;
  final String hintText;
  final String icon;
  final TextCapitalization? capitalization;
  final TextEditingController controller;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.state,
    required this.hintText,
    required this.icon,
    this.capitalization,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.84.r),
        color: Colors.white.withOpacity(0.67),
      ),
      child: TextFormField(
        keyboardType: widget.state == TextFieldState.email
            ? TextInputType.emailAddress
            : TextInputType.text,
        obscureText: widget.state == TextFieldState.password && isObscure,
        enableSuggestions: widget.state != TextFieldState.password,
        cursorColor: AppColors.pink500,
        textCapitalization: widget.capitalization ?? TextCapitalization.none,
        onEditingComplete: () {
          if (widget.state == TextFieldState.password) {
            FocusScope.of(context).unfocus();
          } else {
            FocusScope.of(context).nextFocus();
          }
        },
        style: TextStyle(
          fontSize: 14.spMin,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 14.spMin,
            fontWeight: FontWeight.w500,
            color: AppColors.grey400,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(
              vertical: widget.icon != AppIcons.emailIcon ? 12.h : 14.h,
            ),
            child: SvgPicture.asset(widget.icon),
          ),
          suffixIcon: widget.state == TextFieldState.password
              ? InkWell(
                  borderRadius: BorderRadius.circular(99),
                  onTap: () => setState(() => isObscure = !isObscure),
                  child: Ink(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: SvgPicture.asset(
                      AppIcons.passwordVisible,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
