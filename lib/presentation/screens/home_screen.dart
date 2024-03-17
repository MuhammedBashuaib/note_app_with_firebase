import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/data/services/auth_service.dart';
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
      body: const HomeScreenBody(),
    );
  }
}
