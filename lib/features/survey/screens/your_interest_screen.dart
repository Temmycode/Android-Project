import 'package:apple_match/config/colors/app_colors.dart';
import 'package:apple_match/config/constants/constants.dart';
import 'package:apple_match/features/survey/providers/interests_provider.dart';
import 'package:apple_match/features/survey/screens/add_photos_screen.dart';
import 'package:apple_match/features/survey/widgets/interests_container.dart';
import 'package:apple_match/shared/extensions/alignment.dart';
import 'package:apple_match/shared/widgets/back_button.dart';
import 'package:apple_match/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourInterestScreen extends ConsumerWidget {
  static const String route = '/your-interests';
  const YourInterestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final interests = ref.watch(interestsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            minimum: EdgeInsets.symmetric(horizontal: 24.w),
            child: Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Interests",
                    style: TextStyle(
                      color: AppColors.pink500,
                      fontWeight: FontWeight.w500,
                      fontSize: 32.spMin,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Select a few of your interests and let everyone know \nwhat you’re passionate about.",
                    style: TextStyle(
                      fontSize: 14.spMin,
                      color: AppColors.grey700,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Wrap(
                    children: List.generate(
                      interestsConstants.length,
                      (index) {
                        final interest = interestsConstants[index];
                        final isSelected = interests.contains(interest);
                        return InterestsContainer(
                          isSelected: isSelected,
                          text: interest,
                          onTap: () {
                            final currentInterests =
                                ref.read(interestsProvider.notifier).state;

                            if (isSelected) {
                              currentInterests.remove(interest);
                            } else {
                              currentInterests.add(interest);
                            }
                            ref.read(interestsProvider.notifier).state =
                                List.from(currentInterests);
                          },
                        );
                      },
                    ).animate(interval: 100.ms).fade(
                          duration: 50.ms,
                          curve: Curves.bounceIn,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            child: SafeArea(
              top: false,
              child: PrimaryButton(
                onTap: () {
                  Navigator.pushNamed(context, AddPhotoScreen.route);
                },
                text: "Confirm",
              ).bottom(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: const SafeArea(child: AppBackButton(isCircular: true)),
          ),
        ],
      ),
    );
  }
}
