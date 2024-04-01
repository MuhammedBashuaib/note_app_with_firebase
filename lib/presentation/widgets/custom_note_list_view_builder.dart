import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:note_app_with_firebase/cubits/delete_note_cubit/delete_note_cubit.dart';
import 'package:note_app_with_firebase/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app_with_firebase/data/models/note_model.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_note_item.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_show_dialog.dart';
import 'package:note_app_with_firebase/res/routes.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class CustomNoteListViewBuilder extends StatefulWidget {
  const CustomNoteListViewBuilder({
    super.key,
    required this.notes,
  });

  final List<NoteModel> notes;

  @override
  State<CustomNoteListViewBuilder> createState() =>
      _CustomNoteListViewBuilderState();
}

class _CustomNoteListViewBuilderState extends State<CustomNoteListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    BuildContext currentContext = context;

    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: widthScreen * .02,
        vertical: heightScreen * .01,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: widget.notes.length,
      itemBuilder: (context, index) {
        return BlocConsumer<DeleteNoteCubit, DeleteNoteState>(
          listener: (context, state) {
            if (state is DeleteNoteFailureState) {
              customShowDialog(
                context: context,
                title: "Error",
                content: state.erorrMessage,
                onPressed: null,
              );
            }
          },
          builder: (context, state) {
            return CustomNoteItem(
              imageUrl: widget.notes[index].imageUrl,
              noteTitle: widget.notes[index].noteTitle,
              note: widget.notes[index].note,
              date: widget.notes[index].createdDate.toString(),
              onPressedDelete: () async {
                customShowDialog(
                  context: context,
                  title: "Confirm deletion",
                  content: "Are sure of the deleting process ?",
                  showCancelButton: true,
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await BlocProvider.of<DeleteNoteCubit>(context).deleteNote(
                      categoryId: widget.notes[index].categoryId,
                      noteId: widget.notes[index].id,
                      imageUrl: widget.notes[index].imageUrl,
                    );

                    setState(
                      () {
                        BlocProvider.of<NotesCubit>(currentContext).getAllNotes(
                          categoryId: widget.notes[index].categoryId,
                        );
                      },
                    );
                  },
                );
              },
              onTap: () {
                Navigator.of(context).pushNamed(
                  MyRoutes.editeNoteScreen,
                  arguments: widget.notes[index],
                );
              },
            );
          },
        );
      },
    );
  }
}
