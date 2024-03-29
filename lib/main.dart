import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:note_app_with_firebase/cubits/categories_cubit/categories_cubit.dart';
import 'package:note_app_with_firebase/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app_with_firebase/firebase_options.dart';
import 'package:note_app_with_firebase/res/routes.dart';
import 'package:note_app_with_firebase/res/sizes.dart';
import 'package:note_app_with_firebase/res/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeHWFSize(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoriesCubit>(
          create: (context) => CategoriesCubit(),
        ),
        BlocProvider<NotesCubit>(
          create: (context) => NotesCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData(),
        routes: routes,
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? MyRoutes.signInScreen
            : MyRoutes.homeScreen,
      ),
    );
  }
}
