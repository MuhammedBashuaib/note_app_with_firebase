import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/data/services/auth/auth_service.dart';
import 'package:note_app_with_firebase/presentation/widgets/home_screen_body.dart';
import 'package:note_app_with_firebase/res/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              AuthService().logout();
              Navigator.of(context).pushNamedAndRemoveUntil(
                MyRoutes.signInScreen,
                (route) => false,
              );
            },
            icon: const Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(MyRoutes.addCategoryScreen);
        },
        child: const Icon(Icons.add),
      ),
      body: const HomeScreenBody(),
    );
  }
}
