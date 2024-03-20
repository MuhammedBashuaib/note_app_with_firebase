import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'logout_state.dart';

class LogoutCubitCubit extends Cubit<LogoutCubitState> {
  LogoutCubitCubit() : super(LogoutCubitInitial());
}
