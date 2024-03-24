import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/presentation/widgets/category_screen_body.dart';
import 'package:note_app_with_firebase/res/routes.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(MyRoutes.editCategoryScreen);
        },
        child: const Icon(Icons.edit),
      ),
      body: const CategoryScreenBody(),
    );
  }
}
