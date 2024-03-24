part of 'edit_category_cubit.dart';

@immutable
sealed class EditCategoryState {}

final class EditCategoryInitial extends EditCategoryState {}

final class EditCategoryLoadingState extends EditCategoryState {}

final class EditCategorySuccessState extends EditCategoryState {}

final class EditCategoryFailureState extends EditCategoryState {
  final String erorrMessage;

  EditCategoryFailureState({
    required this.erorrMessage,
  });
}
