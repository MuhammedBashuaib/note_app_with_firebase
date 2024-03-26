import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app_with_firebase/res/const.dart';

class NoteModel {
  String id;
  String categoryId;
  String noteTitle;
  String note;
  String createdDate;

  NoteModel(
      {required this.id,
      required this.categoryId,
      required this.noteTitle,
      required this.note,
      required this.createdDate});

  factory NoteModel.fromFirestore(DocumentSnapshot doc, categoryId) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return NoteModel(
      id: doc.id,
      categoryId: categoryId,
      noteTitle: data[MyNotekeys.kNoteTitle],
      note: data[MyNotekeys.kNote],
      createdDate: data[MyNotekeys.kCreatedDate],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      MyNotekeys.kId: id,
      MyNotekeys.kNoteTitle: noteTitle,
      MyNotekeys.kNote: note,
      MyNotekeys.kCreatedDate: createdDate,
    };
  }
}
