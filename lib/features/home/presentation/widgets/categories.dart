import 'package:flutter/material.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/features/products/domain/entities/category.dart';
import 'package:shopify/features/home/presentation/widgets/category_button.dart';

class Categories extends StatelessWidget {
  final List<Category> categories;

  const Categories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    addAllcategoriesButton();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              ...List.generate(
                categories.length,
                (index) => CategoryBtn(
                  category: categories[index].name,
                  image: categories[index].image,
                  isActive: index == 0,
                  press: () {}, //todo
                  isFirst: index == 0,
                  isLast: index == categories.length - 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void addAllcategoriesButton() {
    categories.insert(0, Category(name: "All Categories"));
  }
}
