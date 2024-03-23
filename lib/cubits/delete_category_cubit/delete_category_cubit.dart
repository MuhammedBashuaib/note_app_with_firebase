import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_firebase/data/services/firestore_services/category_service.dart';

part 'delete_category_state.dart';

class DeleteCategoryCubit extends Cubit<DeleteCategoryState> {
  DeleteCategoryCubit() : super(DeleteCategoryInitial());

  final CategoryService _categoryService = CategoryService();

  Future<void> deleteCategory({required String categoryId}) async {
    emit(DeleteCategoryLoadingState());
    try {
      _categoryService.deleteCategory(id: categoryId);
      emit(DeleteCategorySuccessState());
    } on Exception catch (e) {
      emit(
        DeleteCategoryFailureState(
          erorrMessage: e.toString(),
        ),
      );
    }
  }
}
