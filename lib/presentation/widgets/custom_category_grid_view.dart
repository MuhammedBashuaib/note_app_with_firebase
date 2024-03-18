import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/data/models/category_model.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_category_card.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class CusgomCategoryGridView extends StatelessWidget {
  const CusgomCategoryGridView({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: heightScreen * .18,
        crossAxisSpacing: 5,
        mainAxisSpacing: 7,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CustomCategoryCard(
          categoyName: categories[index].categoryName,
          onTap: () {},
        );
      },
    );
  }
}
