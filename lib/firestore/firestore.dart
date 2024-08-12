import 'package:cloud_firestore/cloud_firestore.dart';

class firestoreServices {

  //Get Collection
  final CollectionReference notes = 
            FirebaseFirestore.instance.collection('notes');

  //CREATE
  Future<void> addNote(String note){
    return notes.add({
      'note':note,
      'timestamp': Timestamp.now(),
    } 
    );
  }


  //READ

  Stream<QuerySnapshot> getNotesStream () {
    final notesStream =
      notes.orderBy('timestamp',descending: true).snapshots();

    return notesStream;
  }


  //UPDATE
  Future<void> updateNote(String docID, String newNote) async {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    }
    );
  }


  //DELETE
  Future<void> deleteNote(String docID) async {
    return notes.doc(docID).delete();
  }
}