import 'package:flutter/material.dart';
import 'package:fnote_app/models/note_model.dart';
import 'package:fnote_app/provider/note_provider.dart';
import 'package:fnote_app/utils/colors.dart';
import 'package:fnote_app/utils/date_time.dart';
import 'package:fnote_app/widgets/app_title.dart';
import 'package:fnote_app/widgets/decorations.dart';
import 'package:provider/provider.dart';

class CreateNotePage extends StatefulWidget {
  final Map<String, NoteModel?> arguments;

  const CreateNotePage({Key? key, required this.arguments}) : super(key: key);

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  final _titleController = TextEditingController();
  final _descrController = TextEditingController();

  late NoteProvider noteProvider;

  @override
  void initState() {
    super.initState();
    noteProvider = Provider.of<NoteProvider>(context, listen: false);
  }

  @override
  void dispose() {
    // **save data into database
    _saveData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    NoteModel? model = widget.arguments['model'];
    if (model != null) {
      _titleController.text = model.title;
      _descrController.text = model.description;
    }

    return Scaffold(
        backgroundColor: Colorr.backgroundColor,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppTitle(title: "FNote app", subtitle: "Create note"),
                const SizedBox(height: 30.0),
                const Text(
                  "Title",
                  textScaleFactor: 1.1,
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  controller: _titleController,
                  style: const TextStyle(color: Colors.white),
                  decoration: Decorations.getTextFieldDecoration(),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Desciption",
                  textScaleFactor: 1.1,
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5.0),
                Expanded(
                  child: TextField(
                    controller: _descrController,
                    textAlignVertical: TextAlignVertical.top,
                    style: const TextStyle(color: Colors.white),
                    maxLines: null,
                    expands: true,
                    decoration: Decorations.getTextFieldDecoration(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _saveData() {
    NoteModel? model = widget.arguments['model'];
    var _title = _titleController.text;
    var _desc = _descrController.text;
    var _date = DateTimeHandler.date;
    var _time = DateTimeHandler.time;

    if (_title.isNotEmpty) {
      if (model != null) {
        if (model.title != _title || model.description != _desc) {
          // **Duplicate record
          noteProvider.insert(
              NoteModel(
                id: model.id,
                title: _title,
                description: _desc,
                date: _date,
                time: _time,
              ),
              true);
        }
      } else {
        // **New record
        noteProvider.insert(
            NoteModel(
                id: 0,
                title: _title,
                description: _desc,
                date: _date,
                time: _time),
            false);
      }
    }

    _titleController.dispose();
    _descrController.dispose();
  }
}
