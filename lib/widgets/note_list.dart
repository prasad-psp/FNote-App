import 'package:flutter/material.dart';
import 'package:fnote_app/models/note_model.dart';
import 'package:fnote_app/provider/note_provider.dart';
import 'package:fnote_app/utils/colors.dart';
import 'package:provider/provider.dart';
import '../routes/app_routes.dart';

//** Note list design
class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  void initState() {
    super.initState();
    Provider.of<NoteProvider>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(builder: (context, provider, child) {
      return Expanded(
          child: ListView.builder(
        shrinkWrap: true,
        itemCount: provider.modelList.length,
        itemBuilder: (context, index) {
          return NoteListItem(model: provider.modelList.elementAt(index));
        },
      ));
    });
  }
}

// ** Note list item design
class NoteListItem extends StatelessWidget {
  final NoteModel model;
  const NoteListItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.createNoteRoute,
            arguments: {"model": model});
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        color: Colorr.lightGrey,
        child: ListTile(
          leading: const Icon(Icons.note_alt_outlined, color: Colors.white30),
          title: Text(
            model.title,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            "${model.date} ${model.time}",
            style: const TextStyle(color: Colors.white),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            color: Colors.white30,
            onPressed: () {
              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //     content: Text("Remove clicked ${index.toString()}")));
            },
          ),
        ),
      ),
    );
  }
}
