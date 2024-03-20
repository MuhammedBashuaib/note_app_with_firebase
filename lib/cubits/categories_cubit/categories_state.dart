part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoadingState extends CategoriesState {}

final class CategoriesSuccessState extends CategoriesState {}

final class CategoriesFailureState extends CategoriesState {
  final String erorrMessage;

  CategoriesFailureState({
    required this.erorrMessage,
  });
}
