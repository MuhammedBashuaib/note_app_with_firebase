import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_firebase/data/services/firestore_services/category_service.dart';

part 'add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit() : super(AddCategoryInitial());

  final CategoryService _categoryService = CategoryService();

  Future<void> addCategory({
    required String uid,
    required String categoryName,
    required DateTime createdDate,
  }) async {
    emit(AddCategoryLoadingState());
    String value = await _categoryService.addCategory(
      uid: uid,
      categoryName: categoryName,
      createdDate: createdDate,
    );
    if (value == "success") {
      emit(AddCategorySuccessState());
    } else {
      emit(
        AddCategoryFailureState(
          erorrMessage: value,
        ),
      );
    }
  }
}
