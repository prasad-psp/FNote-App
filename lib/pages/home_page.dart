import 'package:flutter/material.dart';
import 'package:fnote_app/routes/app_routes.dart';
import 'package:fnote_app/utils/colors.dart';
import 'package:fnote_app/widgets/app_title.dart';
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
                AppTitle(title: "FNote App", subtitle: "Note list"),
                SizedBox(height: 20.0),
                NoteList(),
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colorr.amber,
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.createNoteRoute,
              arguments: {"model": null});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
