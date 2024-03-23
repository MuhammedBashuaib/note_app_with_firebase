import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delete_category_state.dart';

class DeleteCategoryCubit extends Cubit<DeleteCategoryState> {
  DeleteCategoryCubit() : super(DeleteCategoryInitial());
}
