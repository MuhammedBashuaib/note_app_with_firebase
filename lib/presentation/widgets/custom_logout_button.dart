import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_firebase/cubits/logout_cubit/logout_cubit.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_show_dialog.dart';

class CustomLogoutButton extends StatelessWidget {
  const CustomLogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        customShowDialog(
          context: context,
          title: "Message",
          content: "Are you sure to logout ?",
          showCancelButton: true,
          onPressed: () {
            BlocProvider.of<LogoutCubit>(context).logout();
          },
        );
      },
      icon: const Icon(
        Icons.logout,
      ),
    );
  }
}
