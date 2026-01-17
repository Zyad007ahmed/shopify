import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/core/theme/app_colors.dart';

class LoadingHomeSkelton extends StatelessWidget {
  const LoadingHomeSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: AppColors.greyColor,
            highlightColor: Colors.white,
            child: Container(
              color: Colors.red,
              child: AspectRatio(aspectRatio: 1.87),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              "Categories",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                loadingCategoryBtn(isFirst: true, isLast: false),
                loadingCategoryBtn(isFirst: false, isLast: false),
                loadingCategoryBtn(isFirst: false, isLast: false),
                loadingCategoryBtn(isFirst: true, isLast: true),
              ],
            ),
          ),
          loadingCategorySection(),
          loadingCategorySection(),
          loadingCategorySection(),
        ],
      ),
    );
  }

  Widget loadingCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding / 2),
        Shimmer.fromColors(
          baseColor: AppColors.greyColor,
          highlightColor: Colors.white,
          child: Container(
            margin: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultBorderRadious),
              color: Colors.red,
            ),
            width: 100,
            height: 36,
          ),
        ),
        Shimmer.fromColors(
          baseColor: AppColors.greyColor,
          highlightColor: Colors.white,
          child: SizedBox(
            height: 220,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: defaultPadding,
                    right: index == 5 ? defaultPadding : 0,
                  ),
                  child: Container(
                    width: 140,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultBorderRadious),
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget loadingCategoryBtn({required bool isFirst, required bool isLast}) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyColor,
      highlightColor: Colors.white,
      child: Container(
        padding: EdgeInsets.only(
          left: isFirst ? defaultPadding : defaultPadding / 2,
          right: isLast ? defaultPadding : 0,
        ),
        height: 36,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
      ),
    );
  }
}
