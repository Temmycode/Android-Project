import 'package:apple_match/config/colors/app_colors.dart';
import 'package:apple_match/config/constants/constants.dart';
import 'package:apple_match/config/icons/app_icons.dart';
import 'package:apple_match/config/images/app_images.dart';
import 'package:apple_match/config/providers/discover_people_provider.dart';
import 'package:apple_match/features/discover/providers/settings_providers.dart';
import 'package:apple_match/features/discover/widgets/discover_card.dart';
import 'package:apple_match/features/discover/widgets/discover_shimmer_widget.dart';
import 'package:apple_match/features/profile/widget/profile_list_tile.dart';
import 'package:apple_match/features/survey/widgets/interests_container.dart';
import 'package:apple_match/shared/extensions/alignment.dart';
import 'package:apple_match/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class DiscoverScreen extends ConsumerStatefulWidget {
  static const String route = '/discover';
  const DiscoverScreen({super.key});

  @override
  ConsumerState<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends ConsumerState<DiscoverScreen> {
  bool viewAllInterests = false;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    final discoverNewUsers = ref.watch(discoverPeopleProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              titleSpacing: 24.w,
              centerTitle: false,
              pinned: true,
              elevation: 0,
              scrolledUnderElevation: 0,
              title: Text(
                "Discover",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 32.spMin,
                  color: AppColors.pink500,
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(99.9.r),
                    onTap: () {},
                    child: Ink(
                      height: 48.h,
                      width: 48.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.purple500.withOpacity(0.2),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(99.9.r),
                      ),
                      child: SvgPicture.asset(
                        AppIcons.search,
                        height: 24,
                      ).center(),
                    ),
                  ),
                ),
                // ! menu button
                Padding(
                  padding: EdgeInsets.only(right: 24.w),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(99.9.r),
                    onTap: () {
                      showSettingsMenu(context);
                    },
                    child: Ink(
                      height: 48.h,
                      width: 48.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.purple500.withOpacity(0.2),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(99.9.r),
                      ),
                      child: SvgPicture.asset(AppIcons.menu).center(),
                    ),
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size(double.maxFinite, 22.h),
                child: Container(),
              ),
            ),

            // ! discover new user's
            SliverToBoxAdapter(
              child: SizedBox(
                height: 160.h,
                child: discoverNewUsers.when(
                  data: (users) {
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      scrollDirection: Axis.horizontal,
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];

                        return DiscoverCard(user: user);
                      },
                    );
                  },
                  error: (error, stk) => const Icon(Icons.error),
                  loading: () => const DiscoverShimmerWidget(),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: 20.h,
                bottom: 24.h,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Interest",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.spMin,
                            color: AppColors.black100,
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(99.r),
                          onTap: () {
                            setState(() {
                              viewAllInterests = !viewAllInterests;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "View all",
                              style: TextStyle(
                                fontSize: 14.spMin,
                                color: AppColors.pink500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Wrap(
                      children: List.generate(
                        viewAllInterests ? interestsConstants.length : 5,
                        (index) => InterestsContainer(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          text: interestsConstants[index],
                          isSelected: selectedIndex == index,
                          bottomPadding: 12.h,
                          isSingleSelect: true,
                        ),
                      ).animate(interval: 150.ms).fadeIn(duration: 50.ms),
                    )
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Around me",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.spMin,
                        color: AppColors.black100,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    RichText(
                      text: TextSpan(
                        text: "People with ",
                        style: TextStyle(
                          fontSize: 14.spMin,
                          color: AppColors.grey700,
                        ),
                        children: [
                          TextSpan(
                            text: "“Music”",
                            style: TextStyle(
                              fontSize: 14.spMin,
                              color: AppColors.pink500,
                            ),
                          ),
                          TextSpan(
                            text: " interest around you",
                            style: TextStyle(
                              fontSize: 14.spMin,
                              color: AppColors.grey700,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // TODO: A MAP
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  final spaceProvider = StateProvider<double>((ref) => 0.0);

  showSettingsMenu(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      elevation: 0,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.r),
      ),
      builder: (context) {
        return Consumer(builder: (context, ref, child) {
          final ageRangeStart = ref.watch(ageRangeStartProvider);
          final ageRangeEnd = ref.watch(ageRangeEndProvider);

          final appleRangeStart = ref.watch(appleRangeStartProvider);
          final appleRangeEnd = ref.watch(appleRangeEndProvider);
          final spaceRangeStart = ref.watch(spaceRangeStartProvider);
          final spaceRangeEnd = ref.watch(spaceRangeEndProvider);
          final setUp = ref.watch(setUpProvider);

          return StatefulBuilder(builder: (context, setState) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.75,
              maxChildSize: 0.9,
              builder: (context, controller) {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      controller: controller,
                      child: Column(
                        children: [
                          SizedBox(height: 24.h),
                          SizedBox(height: 21.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Set Up",
                                  style: TextStyle(
                                    fontSize: 20.spMin,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.pink500,
                                  ),
                                ),
                                FlutterSwitch(
                                  value: setUp,
                                  onToggle: (value) {
                                    ref.read(setUpProvider.notifier).state =
                                        value;
                                  },
                                  width: 37.5.w,
                                  height: 22.5.h,
                                  activeColor: AppColors.green100,
                                  toggleSize: 10.sp,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Column(
                              children: [
                                Text(
                                  "Interested in",
                                  style: TextStyle(
                                    fontSize: 16.spMin,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ).left(),
                                SizedBox(height: 16.h),
                                ProfileListTile(
                                  leading: SvgPicture.asset(AppIcons.globe),
                                  title: "Country",
                                  trailing: Text(
                                    "All",
                                    style: TextStyle(
                                      fontSize: 16.spMin,
                                    ),
                                  ),
                                  itemSpacing: 8.w,
                                  bottomPadding: 16.h,
                                ),
                                ProfileListTile(
                                  leading: SvgPicture.asset(AppIcons.language),
                                  title: "Language",
                                  trailing: Text(
                                    "All",
                                    style: TextStyle(
                                      fontSize: 16.spMin,
                                    ),
                                  ),
                                  itemSpacing: 8.w,
                                  bottomPadding: 16.h,
                                ),
                                ProfileListTile(
                                  leading: SvgPicture.asset(AppIcons.cake),
                                  title: "Age",
                                  trailing: Text(
                                    "${(ageRangeStart * 100).toStringAsFixed(0)}-${(ageRangeEnd * 100).toStringAsFixed(0)}",
                                    style: TextStyle(
                                      fontSize: 16.spMin,
                                    ),
                                  ),
                                  itemSpacing: 8.w,
                                  bottomPadding: 4.h,
                                ),
                                RangeSlider(
                                  min: 0.18,
                                  max: 0.40,
                                  values:
                                      RangeValues(ageRangeStart, ageRangeEnd),
                                  activeColor: AppColors.pink500,
                                  inactiveColor: const Color(0xFFE6E6E6),
                                  onChanged: (values) {
                                    ref
                                        .read(ageRangeStartProvider.notifier)
                                        .state = values.start;
                                    ref
                                        .read(ageRangeEndProvider.notifier)
                                        .state = values.end;
                                  },
                                ),
                                ProfileListTile(
                                  leading: SvgPicture.asset(
                                    AppIcons.apple2,
                                    height: 19.h,
                                  ),
                                  title: "Amount of Apples",
                                  trailing: Text(
                                    "${(appleRangeStart * 100).toStringAsFixed(0)}-${(appleRangeEnd * 100).toStringAsFixed(0)}",
                                    style: TextStyle(
                                      fontSize: 16.spMin,
                                    ),
                                  ),
                                  itemSpacing: 8.w,
                                  bottomPadding: 4.h,
                                ),
                                RangeSlider(
                                  values: RangeValues(
                                    appleRangeStart,
                                    appleRangeEnd,
                                  ),
                                  activeColor: AppColors.pink500,
                                  inactiveColor: const Color(0xFFE6E6E6),
                                  onChanged: (values) {
                                    ref
                                        .read(appleRangeStartProvider.notifier)
                                        .state = values.start;
                                    ref
                                        .read(appleRangeEndProvider.notifier)
                                        .state = values.end;
                                  },
                                ),
                                ProfileListTile(
                                  leading: SvgPicture.asset(AppIcons.signPost),
                                  title: "Space",
                                  trailing: Text(
                                    "${(spaceRangeStart * 100).toStringAsFixed(0)}-${(spaceRangeEnd * 100).toStringAsFixed(0)}",
                                    style: TextStyle(
                                      fontSize: 16.spMin,
                                    ),
                                  ),
                                  itemSpacing: 8.w,
                                  bottomPadding: 4.h,
                                ),
                                RangeSlider(
                                  min: 0.0,
                                  max: 0.4,
                                  values: RangeValues(
                                      spaceRangeStart, spaceRangeEnd),
                                  activeColor: AppColors.pink500,
                                  inactiveColor: const Color(0xFFE6E6E6),
                                  onChanged: (values) {
                                    ref
                                        .read(spaceRangeStartProvider.notifier)
                                        .state = values.start;
                                    ref
                                        .read(spaceRangeEndProvider.notifier)
                                        .state = values.end;
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child: Text(
                                  "Interest",
                                  style: TextStyle(
                                    fontSize: 16.spMin,
                                    color: AppColors.black200.withOpacity(0.5),
                                  ),
                                ).left(),
                              ),
                              SizedBox(height: 12.h),
                              HorizontalListWithTwoColumns(
                                height: 109.h,
                                children: interestsConstants,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(maxHeight: 40.h),
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40.r),
                        ),
                        color: Colors.white,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(top: 24.h),
                        height: 5.h,
                        width: 134.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(99.r),
                          color: const Color(0xFFAFAFAF),
                        ),
                      ).top(),
                    ).top(),
                    SafeArea(
                      minimum: EdgeInsets.symmetric(horizontal: 24.w),
                      child: PrimaryButton(
                        text: "Confirm",
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ).bottom(),
                    )
                  ],
                );
              },
            );
          });
        });
      },
    );
  }
}

class HorizontalListWithTwoColumns extends StatelessWidget {
  final List children;
  final double height;

  const HorizontalListWithTwoColumns({
    super.key,
    required this.children,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height, // Adjust height as needed
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        scrollDirection: Axis.horizontal,
        itemCount: (children.length / 2).ceil(),
        itemBuilder: (context, index) {
          final int firstIndex = index * 2;
          final int secondIndex = firstIndex + 1;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InterestsContainer(
                text: children[firstIndex],
                bottomPadding: 12.h,
              ),
              if (secondIndex < children.length)
                InterestsContainer(
                  text: children[secondIndex],
                  bottomPadding: 12.h,
                ),
            ],
          );
        },
      ),
    );
  }
}
