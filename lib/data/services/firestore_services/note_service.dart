import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app_with_firebase/data/models/note_model.dart';
import 'package:note_app_with_firebase/res/const.dart';

class NoteService {
  final CollectionReference _categories = FirebaseFirestore.instance
      .collection(MyCollictions.kCategoriesCollictions);

  Future<String> addNote({
    required String categoryId,
    required String noteTitle,
    required String note,
    required DateTime createdDate,
  }) async {
    CollectionReference notesCollection =
        _categories.doc(categoryId).collection(MyCollictions.kNoteCollictions);

    return notesCollection
        .add(
          {
            MyNotekeys.kNoteTitle: noteTitle,
            MyNotekeys.kNote: note,
            MyNotekeys.kCreatedDate: createdDate,
          },
        )
        .then(
          (value) => "success",
        )
        .catchError(
          (error) => error.toString(),
        );
  }

  Future<void> editNote({
    required String categoryId,
    required String noteId,
    required String newNoteTitle,
    required String newNote,
  }) async {
    CollectionReference notesCollection =
        _categories.doc(categoryId).collection(MyCollictions.kNoteCollictions);
    await notesCollection.doc(noteId).update({
      MyNotekeys.kNoteTitle: newNoteTitle,
      MyNotekeys.kNote: newNote,
    });
  }

  Future<List<NoteModel>> getAllNotes({
    required String categoryId,
  }) async {
    List<QueryDocumentSnapshot> data = [];
    List<NoteModel> notes = [];
    CollectionReference notesCollection =
        _categories.doc(categoryId).collection(MyCollictions.kNoteCollictions);
    QuerySnapshot querySnapshot =
        await notesCollection.orderBy(MyNotekeys.kCreatedDate).get();
    data.addAll(querySnapshot.docs);

    for (var element in data) {
      notes.add(
        NoteModel.fromFirestore(element, categoryId),
      );
    }

    return notes;
  }

  Future<void> deleteNote({
    required String categoryId,
    required String id,
  }) async {
    CollectionReference notesCollection =
        _categories.doc(categoryId).collection(MyCollictions.kNoteCollictions);
    await notesCollection.doc(id).delete();
  }
}
