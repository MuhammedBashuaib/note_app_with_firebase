import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app_with_firebase/data/models/note_model.dart';
import 'package:note_app_with_firebase/res/const.dart';

class NoteService {
  final CollectionReference _categories = FirebaseFirestore.instance
      .collection(MyCollictions.kCategoriesCollictions);

  Future<String> addNote({
    required String categoryId,
    required String noteTitle,
    required note,
  }) async {
    CollectionReference notesCollection =
        _categories.doc(categoryId).collection(MyCollictions.kNoteCollictions);

    return notesCollection
        .add(
          {
            MyNotekeys.kNoteTitle: noteTitle,
            MyNotekeys.kNote: note,
          },
        )
        .then(
          (value) => "success",
        )
        .catchError(
          (error) => error.toString(),
        );
  }

  Future<List<NoteModel>> getAllNotes({
    required String categoryId,
  }) async {
    List<QueryDocumentSnapshot> data = [];
    List<NoteModel> notes = [];
    CollectionReference notesCollection =
        _categories.doc(categoryId).collection(MyCollictions.kNoteCollictions);
    QuerySnapshot querySnapshot = await notesCollection.get();
    data.addAll(querySnapshot.docs);

    for (var element in data) {
      notes.add(
        NoteModel.fromFirestore(element, categoryId),
      );
    }

    return notes;
  }
}
