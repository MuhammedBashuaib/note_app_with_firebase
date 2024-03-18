import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/data/models/category_model.dart';
import 'package:note_app_with_firebase/data/services/firestore_services/category_service.dart';

import 'package:note_app_with_firebase/presentation/widgets/custom_category_grid_view.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  List<CategoryModel> categories = [];

  bool isLoding = true;

  Future<void> getCategories() async {
    categories.addAll(
      (await CategoryService().getAllCategories()),
    );
    isLoding = false;
    setState(() {});
  }

  @override
  void initState() {
    getCategories();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoding
        ? const Center(child: CircularProgressIndicator())
        : CusgomCategoryGridView(
            categories: categories,
          );
  }
}
