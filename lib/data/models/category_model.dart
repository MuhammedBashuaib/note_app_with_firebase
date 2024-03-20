import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app_with_firebase/res/const.dart';

class CategoryModel {
  String id;
  String uid;
  String categoryName;

  CategoryModel({
    required this.id,
    required this.uid,
    required this.categoryName,
  });

  factory CategoryModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return CategoryModel(
      id: doc.id,
      uid: data[MyCategorykeys.kUid],
      categoryName: data[MyCategorykeys.kCategoryName],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      MyCategorykeys.kId: id,
      MyCategorykeys.kUid: uid,
      MyCategorykeys.kCategoryName: categoryName,
    };
  }
}
