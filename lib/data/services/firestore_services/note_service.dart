import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app_with_firebase/res/const.dart';

class NoteService {
  final CollectionReference _categories = FirebaseFirestore.instance
      .collection(MyCollictions.kCategoriesCollictions);

  Future<String> addNote({required String categoryId, required note}) async {
    CollectionReference notes =
        _categories.doc(categoryId).collection(MyCollictions.kNoteCollictions);

    return notes
        .add(
          {
            MyNotekeys.kNoteName: note,
          },
        )
        .then(
          (value) => "success",
        )
        .catchError(
          (error) => error.toString(),
        );
  }
}
