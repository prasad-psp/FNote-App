import 'package:flutter/material.dart';
import 'package:fnote_app/res/colors.dart';

//** Note list design
class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return NoteListItem(index: index);
      },
    ));
  }
}

// ** Note list item design
class NoteListItem extends StatelessWidget {
  final int index;
  const NoteListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Item clicked ${index.toString()}")));
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        color: Colorr.lightGrey,
        child: ListTile(
          leading: const Icon(Icons.note_alt_outlined, color: Colors.white30),
          title: const Text(
            "hello",
            style: TextStyle(color: Colors.white),
          ),
          subtitle: const Text(
            "20-20-222 10:10:10",
            style: TextStyle(color: Colors.white),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            color: Colors.white30,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Remove clicked ${index.toString()}")));
            },
          ),
        ),
      ),
    );
  }
}
