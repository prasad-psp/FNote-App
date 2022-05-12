import 'package:flutter/material.dart';
import 'package:fnote_app/models/note_model.dart';
import 'package:provider/provider.dart';
import '../provider/note_provider.dart';
import '../utils/colors.dart';

AlertDialog deleteDialog(BuildContext context, NoteModel model) => AlertDialog(
      backgroundColor: Colorr.lightGrey,
      title: const Text(
        "Delete",
        style: TextStyle(color: Colors.white),
      ),
      content: const Text(
        "Are you sure you want to delete this Note?",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        _cancelButton(context),
        _conformButton(context, model),
      ],
    );

// set up the buttons
Widget _cancelButton(BuildContext context) => TextButton(
      child: const Text(
        "CANCEL",
        style: TextStyle(color: Colorr.amber),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

Widget _conformButton(BuildContext context, NoteModel model) => TextButton(
      child: const Text(
        "I'M SURE",
        style: TextStyle(color: Colorr.amber),
      ),
      onPressed: () {
        Provider.of<NoteProvider>(context, listen: false).delete(model);
        Navigator.pop(context);
      },
    );
