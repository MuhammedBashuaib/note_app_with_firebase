part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoadingState extends CategoriesState {}

final class CategoriesSuccessState extends CategoriesState {
  final List<CategoryModel> categories;

  CategoriesSuccessState({
    required this.categories,
  });
}

final class CategoriesFailureState extends CategoriesState {
  final String erorrMessage;

  CategoriesFailureState({
    required this.erorrMessage,
  });
}
