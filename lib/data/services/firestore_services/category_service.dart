import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:note_app_with_firebase/data/models/category_model.dart';
import 'package:note_app_with_firebase/res/const.dart';

class CategoryService {
  final CollectionReference _categories = FirebaseFirestore.instance
      .collection(MyCollictions.kCategoriesCollictions);

  Future<String> addCategory({
    required String uid,
    required String categoryName,
  }) {
    return _categories
        .add(
          {
            MyCategorykeys.kUid: uid,
            MyCategorykeys.kCategoryName: categoryName,
          },
        )
        .then(
          (value) => "success",
        )
        .catchError(
          (error) => error.toString(),
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

  Future<void> deleteCategory({required String id}) async {
    await _categories.doc(id).delete();
  }
}
