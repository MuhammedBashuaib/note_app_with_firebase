import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/data/models/category_model.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_show_dialog.dart';
import 'package:note_app_with_firebase/res/const.dart';

class CategoryService {
  final CollectionReference _categories = FirebaseFirestore.instance
      .collection(MyCollictions.kCategoriesCollictions);

  Future<void> addCategory({
    required String categoryName,
    required BuildContext context,
  }) {
    return _categories
        .add(
          {
            MyString.kCategoryName: categoryName, // John Doe
          },
        )
        .then(
          (value) => customShowDialog(
            context: context,
            title: "Message",
            content: "category Added",
            onPressed: null,
          ),
        )
        .catchError(
          (error) => customShowDialog(
            context: context,
            title: "Message",
            content: "Failed to add user: $error",
            onPressed: null,
          ),
        );
  }

  Future<List<CategoryModel>> getAllCategories() async {
    List<QueryDocumentSnapshot> data = [];
    List<CategoryModel> categories = [];
    QuerySnapshot querySnapshot = await _categories.get();
    data.addAll(querySnapshot.docs);

    for (var element in data) {
      categories.add(CategoryModel.fromFirestore(element));
    }

    return categories;
  }
}
