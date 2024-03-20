import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_firebase/cubits/add_category_cubit/add_category_cubit.dart';
import 'package:note_app_with_firebase/presentation/widgets/add_category_screen_body.dart';

class AddCategoryScreen extends StatelessWidget {
  const AddCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCategoryCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Category"),
        ),
        body: const AddCategoryScreenBody(),
      ),
    );
  }
}
