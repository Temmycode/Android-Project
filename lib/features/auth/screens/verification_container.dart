import 'package:apple_match/config/colors/app_colors.dart';
import 'package:apple_match/features/auth/providers/timer_provider.dart';
import 'package:apple_match/features/auth/widgets/verification_code_field.dart';
import 'package:apple_match/features/survey/screens/your_interest_screen.dart';
import 'package:apple_match/shared/extensions/alignment.dart';
import 'package:apple_match/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationContainer extends ConsumerStatefulWidget {
  const VerificationContainer({super.key});

  @override
  ConsumerState<VerificationContainer> createState() =>
      _VerificationContainerState();
}

class _VerificationContainerState extends ConsumerState<VerificationContainer> {
  late final TextEditingController code1;
  late final TextEditingController code2;
  late final TextEditingController code3;
  late final TextEditingController code4;

  @override
  void initState() {
    super.initState();
    code1 = TextEditingController();
    code2 = TextEditingController();
    code3 = TextEditingController();
    code4 = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    code1.dispose();
    code2.dispose();
    code3.dispose();
    code4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timer = ref.watch(timerProvider);

    return Container(
      padding: EdgeInsets.only(
        top: 40.h,
        bottom: 42.h,
        left: 17.5,
        right: 17.5,
      ),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27.r),
        color: const Color(0xFFF7F8FA),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 13.32),
            blurRadius: 55.48,
            color: AppColors.purple600.withOpacity(0.05),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Verify Phone Number",
            style: TextStyle(
              fontSize: 22.spMin,
              fontWeight: FontWeight.w600,
              color: AppColors.pink500,
            ),
          ),
          SizedBox(height: 11.h),
          Text(
            "We Have Sent Code To Your Phone Number",
            style: TextStyle(
              fontSize: 14.spMin,
              color: AppColors.grey500,
            ),
          ),
          SizedBox(height: 39.h),
          Text(
            // TODO: SHOULD BE THE PERSON'S NUMBER
            "+000 00000 0000",
            style: TextStyle(
              fontSize: 14.spMin,
              fontWeight: FontWeight.w600,
              color: AppColors.grey500,
            ),
          ),
          SizedBox(height: 29.h),
          Form(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                VerificationCodeField(
                  controller: code1,
                  isFirst: true,
                ),
                VerificationCodeField(controller: code2),
                VerificationCodeField(controller: code3),
                VerificationCodeField(
                  controller: code4,
                  isLast: true,
                ),
              ],
            ),
          ),
          SizedBox(height: 9.h),
          Text(
            '($timer)',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.spMin,
              color: AppColors.grey500,
            ),
          ).left(),
          SizedBox(height: 29.23.h),
          Column(
            children: [
              PrimaryButton(
                text: "Verify",
                height: 68.21.h,
                onTap: () {
                  Navigator.pushNamed(context, YourInterestScreen.route);
                },
              ),
              const SizedBox(height: 12.4),
              PrimaryButton(
                text: "Send Again",
                color: AppColors.grey50,
                textColor: timer != "00:00"
                    ? const Color(0xFFCBCBCB)
                    : AppColors.grey600,
                height: 68.21.h,
                onTap: () async {
                  if (timer != "00:00") {
                    print("it's not done");
                  } else {
                    print("it's done");
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
