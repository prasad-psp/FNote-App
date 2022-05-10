import 'package:flutter/material.dart';
import 'package:fnote_app/models/note_model.dart';
import 'package:fnote_app/utils/colors.dart';
import 'package:fnote_app/widgets/app_title.dart';
import 'package:fnote_app/widgets/decorations.dart';

class CreateNotePage extends StatefulWidget {
  final Map<String, NoteModel?> arguments;

  const CreateNotePage({Key? key, required this.arguments}) : super(key: key);

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  final _titleController = TextEditingController();
  final _descrController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // **save data into database
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
                const AppTitle(title: "Note app", subtitle: "Create note"),
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
}
