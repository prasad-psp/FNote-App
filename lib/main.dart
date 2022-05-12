import 'package:flutter/material.dart';
import 'package:fnote_app/models/note_model.dart';
import 'package:fnote_app/pages/create_note_page.dart';
import 'package:fnote_app/pages/home_page.dart';
import 'package:fnote_app/provider/note_provider.dart';
import 'package:fnote_app/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NoteProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FNote App",
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case AppRoutes.initialRoute:
            {
              return MaterialPageRoute(builder: (context) => const HomePage());
            }
          case AppRoutes.createNoteRoute:
            {
              return MaterialPageRoute(
                  builder: (context) => CreateNotePage(
                      arguments: setting.arguments as Map<String, NoteModel?>));
            }
        }
      },
    );
  }
}
