import 'package:flutter/cupertino.dart';
import 'package:fnote_app/db/note_db.dart';
import '../models/note_model.dart';

class NoteProvider with ChangeNotifier {
  late NoteDatabase noteDatabase;

  List<NoteModel> modelList = [];

  void init() {
    noteDatabase = NoteDatabase();
    read();
  }

  void read() async {
    List<NoteModel> tempList = await noteDatabase.read();
    if (tempList.isNotEmpty) {
      if (modelList.isNotEmpty) {
        modelList.clear();
      }
      modelList.addAll(tempList);
      notifyListeners();
    }
  }

  void insert(NoteModel model, bool isDuplicate) async {
    var noteId = await noteDatabase.insert(model, isDuplicate);
    if (noteId != 0) {
      read();
    }
  }

  void delete(NoteModel model) async {
    var result = await noteDatabase.delete(model);
    if (result != 0) {
      read();
    }
  }
}
