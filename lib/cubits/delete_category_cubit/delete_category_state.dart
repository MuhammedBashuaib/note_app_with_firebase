part of 'delete_category_cubit.dart';

@immutable
sealed class DeleteCategoryState {}

final class DeleteCategoryInitial extends DeleteCategoryState {}

final class DeleteCategoryLoadingState extends DeleteCategoryState {}

final class DeleteCategorySuccessState extends DeleteCategoryState {}

final class DeleteCategoryFailureState extends DeleteCategoryState {
  final String erorrMessage;

  DeleteCategoryFailureState({
    required this.erorrMessage,
  });
}
