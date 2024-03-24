import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_category_state.dart';

class EditCategoryCubit extends Cubit<EditCategoryState> {
  EditCategoryCubit() : super(EditCategoryInitial());
}
