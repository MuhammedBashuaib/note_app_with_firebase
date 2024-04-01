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

  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

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
    Reference? imagesRef = _firebaseStorage.ref("images").child(imageName);
    await imagesRef.putFile(imageFile);
    String? url = await imagesRef.getDownloadURL();
    return url;
  }

  Future<void> editNote({
    required String categoryId,
    required String noteId,
    required String newNoteTitle,
    required String newNote,
    required String imageUrl,
    required File? imageFile,
  }) async {
    CollectionReference notesCollection =
        _categories.doc(categoryId).collection(MyCollictions.kNoteCollictions);
    String? url = imageUrl;
    if (imageFile != null) {
      await deleteImage(imageUrl: imageUrl);
      url = await addImage(imageFile);
    }
    await notesCollection.doc(noteId).update(
      {
        MyNotekeys.kImageUrl: url,
        MyNotekeys.kNoteTitle: newNoteTitle,
        MyNotekeys.kNote: newNote,
      },
    );
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
    required String imageUrl,
  }) async {
    final DocumentReference<Map<String, dynamic>> notesCollection = _categories
        .doc(categoryId)
        .collection(MyCollictions.kNoteCollictions)
        .doc(id);
    await notesCollection.delete();
    await deleteImage(imageUrl: imageUrl);
  }

  Future<void> deleteImage({required imageUrl}) async {
    final desertRef = _firebaseStorage.refFromURL(imageUrl);
    await desertRef.delete();
  }
}
