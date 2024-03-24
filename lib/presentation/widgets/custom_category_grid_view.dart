import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:note_app_with_firebase/cubits/categories_cubit/categories_cubit.dart';
import 'package:note_app_with_firebase/cubits/delete_category_cubit/delete_category_cubit.dart';
import 'package:note_app_with_firebase/data/models/category_model.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_category_card.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_show_dialog.dart';
import 'package:note_app_with_firebase/res/firebase_const.dart';
import 'package:note_app_with_firebase/res/routes.dart';
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
        return BlocConsumer<DeleteCategoryCubit, DeleteCategoryState>(
          listener: (context, state) {
            if (state is DeleteCategoryFailureState) {
              customShowDialog(
                context: context,
                title: "Error",
                content: state.erorrMessage,
                onPressed: null,
              );
            }
          },
          builder: (context, state) {
            return CustomCategoryCard(
              categoyName: categories[index].categoryName,
              onTap: () {
                Navigator.of(context).pushNamed(MyRoutes.categoryScreen);
              },
              onLongPress: () {
                customShowDialog(
                  context: context,
                  title: "Confirm deletion",
                  content: "Are sure of the deleting process ?",
                  showCancelButton: true,
                  onPressed: () async {
                    BlocProvider.of<DeleteCategoryCubit>(context)
                        .deleteCategory(
                      categoryId: categories[index].id,
                    );
                    BlocProvider.of<CategoriesCubit>(context).getAllCategories(
                      uid: MyFirebaseConst.currentUser!.uid,
                    );
                    Navigator.of(context).pop();
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
