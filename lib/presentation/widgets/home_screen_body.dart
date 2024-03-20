import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:note_app_with_firebase/cubits/categories_cubit/categories_cubit.dart';
import 'package:note_app_with_firebase/data/models/category_model.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_category_grid_view.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_show_dialog.dart';
import 'package:note_app_with_firebase/res/firebase_const.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  void initState() {
    BlocProvider.of<CategoriesCubit>(context).getAllCategories(
      uid: MyFirebaseConst.currentUser!.uid,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [];
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {
        if (state is CategoriesSuccessState) {
          categories.clear();
          categories.addAll(state.categories);
        }
        if (state is CategoriesFailureState) {
          customShowDialog(
            context: context,
            title: "Error",
            content: state.erorrMessage,
            onPressed: null,
          );
        }
      },
      builder: (context, state) {
        return state is CategoriesLoadingState
            ? const Center(child: CircularProgressIndicator())
            : CusgomCategoryGridView(
                categories: categories,
              );
      },
    );
  }
}
