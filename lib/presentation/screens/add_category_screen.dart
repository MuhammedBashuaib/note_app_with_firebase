import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/presentation/widgets/add_category_screen_body.dart';

class AddCategoryScreen extends StatelessWidget {
  const AddCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Category"),
      ),
      body: const AddCategoryScreenBody(),
    );
  }
}
