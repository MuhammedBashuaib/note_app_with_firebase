import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_category_card.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class CusgomCategoryGridView extends StatelessWidget {
  const CusgomCategoryGridView({
    super.key,
  });

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
      itemCount: 10,
      itemBuilder: (context, index) {
        return CustomCategoryCard(
          categoyName: "Cummpny",
          onTap: () {},
        );
      },
    );
  }
}
