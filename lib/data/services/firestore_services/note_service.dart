import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:note_app_with_firebase/data/models/note_model.dart';
import 'package:note_app_with_firebase/res/const.dart';

class NoteService {
  final CollectionReference _categories = FirebaseFirestore.instance
      .collection(MyCollictions.kCategoriesCollictions);

  Future<String> addNote({
    required String categoryId,
    required File imageFile,
    required String noteTitle,
    required String note,
    required DateTime createdDate,
  }) async {
    CollectionReference notesCollection =
        _categories.doc(categoryId).collection(MyCollictions.kNoteCollictions);

    String? url = await addImage(imageFile);

    return notesCollection
        .add(
          {
            MyNotekeys.kImageUrl: url,
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

  Future<String?> addImage(File imageFile) async {
    String imageName = basename(imageFile.path);
    Reference? imagesRef =
        FirebaseStorage.instance.ref("images").child(imageName);
    await imagesRef.putFile(imageFile);
    String? url = await imagesRef.getDownloadURL();
    return url;
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
    QuerySnapshot querySnapshot = await notesCollection
        .orderBy(MyNotekeys.kCreatedDate, descending: true)
        .get();
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
