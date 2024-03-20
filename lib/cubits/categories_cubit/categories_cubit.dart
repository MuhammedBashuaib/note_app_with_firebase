import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_firebase/data/models/category_model.dart';
import 'package:note_app_with_firebase/data/services/firestore_services/category_service.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  final CategoryService _categoryService = CategoryService();

  List<CategoryModel> categories = [];

  Future<void> getAllCategories({
    required String uid,
  }) async {
    emit(CategoriesLoadingState());
    try {
      categories.addAll(
        await _categoryService.getAllCategories(uid: uid),
      );
      emit(
        CategoriesSuccessState(
          categories: categories,
        ),
      );
    } on Exception catch (e) {
      emit(
        CategoriesFailureState(
          erorrMessage: e.toString(),
        ),
      );
    }
  }

  // Future<void> getCategories() async {
  //   categories.addAll(
  //     (await CategoryService().getAllCategories()),
  //   );
  //   isLoding = false;
  //   setState(() {});
  // }
}
