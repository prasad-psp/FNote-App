import 'package:flutter/material.dart';
import 'package:fnote_app/res/colors.dart';
import 'package:fnote_app/widgets/note_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorr.backgroundColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Note App",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colorr.amber),
                  textScaleFactor: 2.0,
                ),
                SizedBox(height: 5.0),
                Text(
                  "Note list",
                  style: TextStyle(
                      color: Colorr.lightPurple, fontWeight: FontWeight.w500),
                  textScaleFactor: 1.5,
                ),
                SizedBox(height: 20.0),
                NoteList(),
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colorr.amber,
        foregroundColor: Colors.black,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
