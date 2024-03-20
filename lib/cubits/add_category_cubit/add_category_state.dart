part of 'add_category_cubit.dart';

@immutable
sealed class AddCategoryState {}

final class AddCategoryInitial extends AddCategoryState {}

final class AddCategoryLoadingState extends AddCategoryState {}

final class AddCategorySuccessState extends AddCategoryState {}

final class AddCategoryFailureState extends AddCategoryState {
  final String erorrMessage;

  AddCategoryFailureState({
    required this.erorrMessage,
  });
}
