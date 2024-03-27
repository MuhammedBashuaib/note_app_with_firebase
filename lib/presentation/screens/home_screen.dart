import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app_with_firebase/cubits/categories_cubit/categories_cubit.dart';
import 'package:note_app_with_firebase/cubits/delete_category_cubit/delete_category_cubit.dart';

import 'package:note_app_with_firebase/cubits/logout_cubit/logout_cubit.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_logout_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_show_dialog.dart';
import 'package:note_app_with_firebase/presentation/widgets/home_screen_body.dart';
import 'package:note_app_with_firebase/res/firebase_const.dart';
import 'package:note_app_with_firebase/res/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LogoutCubit>(
          create: (context) => LogoutCubit(),
        ),
        BlocProvider<DeleteCategoryCubit>(
          create: (context) => DeleteCategoryCubit(),
        ),
      ],
      child: BlocConsumer<LogoutCubit, LogoutState>(
        listener: (context, state) {
          if (state is LogoutSuccessState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              MyRoutes.signInScreen,
              (route) => false,
            );
          }
          if (state is LogoutFailureState) {
            customShowDialog(
              context: context,
              title: "Error",
              content: state.erorrMessage,
              onPressed: null,
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is LogoutLoadingState ? true : false,
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Home"),
                actions: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<CategoriesCubit>(context)
                          .getAllCategories(
                        uid: MyFirebaseConst.currentUser!.uid,
                      );
                    },
                    icon: const Icon(
                      Icons.refresh,
                    ),
                  ),
                  const CustomLogoutButton(),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(MyRoutes.addCategoryScreen);
                },
                child: const Icon(Icons.add),
              ),
              body: const HomeScreenBody(),
            ),
          );
        },
      ),
    );
  }
}
