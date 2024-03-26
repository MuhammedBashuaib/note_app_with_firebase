import 'package:flutter/material.dart';

import 'package:note_app_with_firebase/data/models/category_model.dart';
import 'package:note_app_with_firebase/presentation/widgets/note_view_screen_body.dart';
import 'package:note_app_with_firebase/res/routes.dart';

class NoteViewScreen extends StatelessWidget {
  const NoteViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryModel category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.categoryName),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                MyRoutes.editCategoryScreen,
                arguments: category,
              );
            },
            icon: const Icon(
              Icons.edit,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            MyRoutes.addNoteScreen,
            arguments: category,
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: NoteViewScreenBody(
        category: category,
      ),
    );
  }
}
