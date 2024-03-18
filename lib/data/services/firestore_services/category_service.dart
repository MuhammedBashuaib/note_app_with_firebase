import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/data/models/category_model.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_show_dialog.dart';

class CategoryService {
  final CollectionReference _categories =
      FirebaseFirestore.instance.collection('categories');

  Future<void> addCategory({
    required String categoryName,
    required BuildContext context,
  }) {
    return _categories
        .add(
          {
            'category_name': categoryName, // John Doe
          },
        )
        .then(
          (value) => customShowDialog(
            context: context,
            title: "Message",
            content: "category Added",
          ),
        )
        .catchError(
          (error) => customShowDialog(
            context: context,
            title: "Message",
            content: "Failed to add user: $error",
          ),
        );
  }

  // Future<List<QueryDocumentSnapshot>> getAllCategories() async {
  //   List<QueryDocumentSnapshot> data = [];
  //   QuerySnapshot querySnapshot = await _categories.get();
  //   data.addAll(querySnapshot.docs);
  //   return data;
  // }

  Future<List<CategoryModel>> getAllCategories() async {
    List<QueryDocumentSnapshot> data = [];
    List<CategoryModel> categories = [];
    QuerySnapshot querySnapshot = await _categories.get();
    data.addAll(querySnapshot.docs);
    for (var i = 0; i < data.length; i++) {
      categories.add(
        CategoryModel(
          categoryName: data[i]["category_name"].toString(),
        ),
      );
    }
    return categories;
  }
}
