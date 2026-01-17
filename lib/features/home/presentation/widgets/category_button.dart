import 'package:flutter/material.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/core/theme/app_colors.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn({
    super.key,
    required this.category,
    this.image,
    required this.isActive,
    required this.press,
    required this.isFirst,
    required this.isLast,
  });

  final String category;
  final String? image;
  final bool isActive;
  final VoidCallback press;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: isFirst ? defaultPadding : defaultPadding / 2,
        right: isLast ? defaultPadding : 0,
      ),
      child: InkWell(
        onTap: press,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: Container(
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primaryColor : Colors.transparent,
            border: Border.all(
              color: isActive
                  ? Colors.transparent
                  : Theme.of(context).dividerColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(30)),
          ),
          alignment: Alignment.center,
          child: Text(
            category,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isActive
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
        ),
      ),
    );
  }
}
