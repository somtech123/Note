import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:note_app/models/note.dart';

class NoteOperation with ChangeNotifier {
  Map<String, Note> _notes = {};

  Map<String, Note> get getnote {
    return {..._notes};
  }

  // NoteOperation() {
  //   addNewNote('hello', 'worls ');
  // }

  void addNewNote(String id, String title, String description) {
    Note note = Note(
      title,
      DateTime.now().toString(),
      description,
    );
    _notes.putIfAbsent(id, () => note);
    notifyListeners();
  }

  void removeNote(String userid) {
    _notes.remove(userid);
    notifyListeners();
  }
}
