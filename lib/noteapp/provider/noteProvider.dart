import 'package:flutter/material.dart';
import 'package:statemgmt/noteapp/note.dart';
import 'package:statemgmt/yt/screens/fav.dart';

class NoteProvider extends ChangeNotifier {
  List<Note> notes = [];

  List<Note> get n => notes;

  void AddNotes(String title, String description) {
    Note note = Note(
      id: DateTime.now().toString(),
      title: title,
      description: description,
    );
    notes.add(note);
    notifyListeners();
  }

  void remove(String id) {
    notes.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  List<int> fav = [];
  List<int> get f => fav;

  void addFav(int index) {
    fav.add(index);
    notifyListeners();
  }

  void removeFav(int index) {
    fav.remove(index);
    notifyListeners();
  }

  // void update(String id, String title, String description) {}
  // List<Note> fav = [];
  // List<Note> get davourite => fav;
  // void addFav(String id, String title, String description) {
  //   Note a = new Note(
  //     id: id,
  //     title: title,
  //     description: description,
  //   );
  //   fav.add(a);
  //   notifyListeners();
  // }
}
