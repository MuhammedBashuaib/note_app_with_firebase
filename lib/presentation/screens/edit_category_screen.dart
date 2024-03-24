import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_firebase/cubits/edit_category_cubit/edit_category_cubit.dart';
import 'package:note_app_with_firebase/presentation/widgets/edit_category_screen_body.dart';

class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditCategoryCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Category Edit"),
        ),
        body: const EditCategoryScreenBody(),
      ),
    );
  }
}
