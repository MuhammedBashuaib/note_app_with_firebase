import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_firebase/data/services/firestore_services/category_service.dart';

part 'edit_category_state.dart';

class EditCategoryCubit extends Cubit<EditCategoryState> {
  EditCategoryCubit() : super(EditCategoryInitial());

  final CategoryService _categoryService = CategoryService();

  Future<void> editCategory({
    required String categoryId,
    required String categorName,
  }) async {
    emit(EditCategoryLoadingState());
    try {
      await _categoryService.editCategory(
        categoryId: categoryId,
        newName: categorName,
      );
      emit(EditCategorySuccessState());
    } on Exception catch (e) {
      emit(
        EditCategoryFailureState(
          erorrMessage: e.toString(),
        ),
      );
    }
  }
}
