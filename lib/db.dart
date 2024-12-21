
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_notes/models/note.dart';

final db = FirebaseFirestore.instance;

const String notesName = 'notes';

final notesCollection = db.collection(notesName).withConverter(fromFirestore: Note.fromFirestore, toFirestore:(value, options) => value.toMap());

void setNotes(Note note) async {
  await notesCollection.doc(note.id).set(note);
}

void deleteNote(String id) async {
  await notesCollection.doc(id).delete();
}
