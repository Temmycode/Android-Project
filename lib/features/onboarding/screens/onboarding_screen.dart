import 'package:apple_match/config/colors/app_colors.dart';
import 'package:apple_match/config/images/app_images.dart';
import 'package:apple_match/features/onboarding/widgets/onboarding1.dart';
import 'package:apple_match/shared/extensions/alignment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OnboardingScreen extends StatefulWidget {
  static const String route = '/onboarding';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _controller;
  int _currentPage = 0;

  final onboarding = [Onboarding1(), Onboarding2()];

  final onboardingItems = [
    {
      "image": AppImages.onboarding1,
      "topic": "Find Your Perfect Match, \nOne Apple at a Time",
      "subtopic": "Gift Apples to show interest and find your \nmatch"
    },
    {
      "image": AppImages.onboarding2,
      "topic": "Introducing The Apple \nGenie",
      "subtopic":
          "Our Advanced AI for for compatibility \ninsights during live chats and calls."
    },
    {
      "image": AppImages.onboarding3,
      "topic": "Our First Date \nTradition",
      "subtopic": "Bring and Exchange an apple on your \nfirst date"
    },
    {
      "image": AppImages.onboarding4,
      "topic": "Introducing Apple Bucket",
      "subtopic": "Each user begins with 100 apples to gift \nwisely"
    },
    {
      "image": AppImages.onboarding4,
      "topic": "Apple Rot",
      "subtopic":
          "Apples that have been gifted to another \nuser will rot in 3 days if not accepted."
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < onboardingItems.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            color: Colors.white,
          ),
          Positioned(
            child: PageView.builder(
              itemCount: onboarding.length,
              controller: _controller,
              itemBuilder: (context, index) {
                final item = onboarding[index];
                return item;
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Image.asset(item['image']!, width: 300.w, height: 300.h),
                //     SizedBox(height: 20.h),
                //     Text(
                //       item['topic']!,
                //       textAlign: TextAlign.center,
                //       style: TextStyle(
                //         fontSize: 28.spMin,
                //         fontWeight: FontWeight.w600,
                //         color: AppColors.black200,
                //       ),
                //     ),
                //     SizedBox(height: 12.h),
                //     Text(
                //       item['subtopic']!,
                //       textAlign: TextAlign.center,
                //       style: TextStyle(
                //         fontSize: 14.spMin,
                //         color: AppColors.grey700,
                //       ),
                //     ),
                //   ],
                // );
              },
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 8.h, right: 49.w),
              child: InkWell(
                onTap: () {
                  // Navigate to the next screen or handle the skip action
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.spMin,
                    color: const Color(0xFFD7D7D7),
                  ),
                ),
              ).topRight(),
            ),
          ),
          Positioned(
            bottom: 69.h,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.all(24.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    width: 154.w,
                    height: 64.h,
                    decoration: BoxDecoration(
                      color: AppColors.white100,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 40),
                          color: const Color(0xFF0F0F0F).withOpacity(0.12),
                          blurRadius: 32,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: _goToPreviousPage,
                          child: Icon(
                            FontAwesomeIcons.arrowLeftLong,
                            size: 24.spMin,
                          ),
                        ),
                        Container(
                          height: 24.h,
                          width: 2.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.r),
                            color: const Color(0xFFE6E8EC),
                          ),
                        ),
                        InkWell(
                          onTap: _goToNextPage,
                          child: Icon(
                            FontAwesomeIcons.arrowRightLong,
                            size: 24.spMin,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ).center(),
            ),
          ),
        ],
      ),
    );
  }
}
