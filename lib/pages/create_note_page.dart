import 'package:flutter/material.dart';
import 'package:fnote_app/db/note_db.dart';
import 'package:fnote_app/models/note_model.dart';
import 'package:fnote_app/utils/colors.dart';
import 'package:fnote_app/utils/date_time.dart';
import 'package:fnote_app/widgets/app_title.dart';
import 'package:fnote_app/widgets/decorations.dart';

class CreateNotePage extends StatefulWidget {
  final Map<String, String> arguments;

  const CreateNotePage({Key? key, required this.arguments}) : super(key: key);

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  final _titleController = TextEditingController();
  final _descrController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // **save data into database
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.arguments['title'].toString();
    final description = widget.arguments['description'].toString();
    _titleController.text = title;
    _descrController.text = description;

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
