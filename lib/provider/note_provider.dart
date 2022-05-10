import 'package:flutter/cupertino.dart';
import 'package:fnote_app/db/note_db.dart';

import '../models/note_model.dart';

class NoteProvider with ChangeNotifier {
  NoteDatabase? noteDatabase;

  List<NoteModel>? modelList;

  void init() {
    noteDatabase = NoteDatabase();
    read();
  }

  void read() async {
    List<NoteModel>? tempList = await noteDatabase?.read();
    if (tempList != null) {
      if (tempList.isNotEmpty) {
        modelList = tempList;
        notifyListeners();
      }
    }
  }

  void insert(NoteModel model, bool isDuplicate) async {
    var noteId = await noteDatabase?.insert(model,isDuplicate);
    if (noteId != 0) {
      read();
    }
  }
}
