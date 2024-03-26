import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:note_app_with_firebase/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app_with_firebase/data/models/category_model.dart';
import 'package:note_app_with_firebase/presentation/widgets/add_note_screen_body.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryModel category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Note"),
        ),
        body: AddNoteScreenBody(category: category),
      ),
    );
  }
}
