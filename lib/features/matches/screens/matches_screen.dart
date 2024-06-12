import 'package:apple_match/config/colors/app_colors.dart';
import 'package:apple_match/config/icons/app_icons.dart';
import 'package:apple_match/config/providers/get_match_provider.dart';
import 'package:apple_match/features/matches/widgets/shimmer_match_widget.dart';
import 'package:apple_match/shared/extensions/alignment.dart';
import 'package:apple_match/shared/widgets/back_button.dart';
import 'package:apple_match/shared/widgets/match_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

class MatchesScreen extends ConsumerStatefulWidget {
  static const String route = '/matches';
  const MatchesScreen({super.key});

  @override
  ConsumerState<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends ConsumerState<MatchesScreen>
    with AutomaticKeepAliveClientMixin {
  get itemBuilder => null;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final matches = ref.watch(getMatchProvider);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
        titleSpacing: 24.w,
        centerTitle: true,
        leadingWidth: 24.w,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AppBackButton(isCircular: true),
            Text(
              "Matches",
              style: TextStyle(
                fontSize: 32.spMin,
                fontWeight: FontWeight.w500,
                color: AppColors.pink500,
              ),
            ),
            InkWell(
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
                child: SvgPicture.asset(AppIcons.menu).center(),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 5.h),
              RichText(
                text: TextSpan(
                  text: "Your Matches ",
                  style: TextStyle(
                    color: AppColors.black100,
                    fontSize: 20.spMin,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: "47",
                      style: TextStyle(
                        color: AppColors.pink500,
                        fontSize: 20.spMin,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              matches.when(
                data: (allMatches) {
                  return MasonryGridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    crossAxisSpacing: 20.w,
                    mainAxisSpacing: 20.w,
                    itemCount: allMatches.length,
                    itemBuilder: (context, index) {
                      final user = allMatches[index];

                      return MatchCard(
                        onTap: () {},
                        user: user,
                      );
                    },
                  );
                },
                error: (error, stk) => const Icon(Icons.error),
                loading: () => const ShimmerMatchWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
