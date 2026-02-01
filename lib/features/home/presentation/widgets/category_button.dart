import 'package:flutter/material.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/core/router/routes.dart';
import 'package:shopify/core/theme/app_colors.dart';
import 'package:shopify/core/utils/extensions.dart';
import 'package:shopify/features/products/domain/entities/category.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn({
    super.key,
    required this.category,
    required this.isActive,
    required this.isFirst,
    required this.isLast,
  });

  final Category category;
  final bool isActive;
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
        onTap: () => onPress(context),
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
            category.name,
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

  void onPress(BuildContext context) {
    if (category.id != 0) {
      context.pushNamed(categoryProductsScreenRoute, arguments: category);
    }
  }
}
