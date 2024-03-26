import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app_with_firebase/cubits/edit_note_cubit/edit_note_cubit.dart';

import 'package:note_app_with_firebase/data/models/note_model.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_show_dialog.dart';
import 'package:note_app_with_firebase/presentation/widgets/edit_note_form.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class EditNoteScreenBody extends StatefulWidget {
  const EditNoteScreenBody({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  State<EditNoteScreenBody> createState() => _EditNoteScreenBodyState();
}

class _EditNoteScreenBodyState extends State<EditNoteScreenBody> {
  TextEditingController noteTitleController = TextEditingController();

  TextEditingController noteController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    noteTitleController.text = widget.note.noteTitle;
    noteController.text = widget.note.note;

    return BlocConsumer<EditNoteCubit, EditNoteState>(
      listener: (context, state) {
        if (state is EditNoteSuccessState) {
          customShowDialog(
            context: context,
            title: "Message",
            content: "Modified successfully",
            onPressed: null,
          );
        }
        if (state is EditNoteFailureState) {
          customShowDialog(
            context: context,
            title: "Message",
            content: "Failed to edit user: ${state.erorrMessage}",
            onPressed: null,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is EditNoteLoadingState ? true : false,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widthScreen * .04,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: EditNoteForm(
                formKey: formKey,
                noteTitleController: noteTitleController,
                noteController: noteController,
                note: widget.note,
              ),
            ),
          ),
        );
      },
    );
  }
}
