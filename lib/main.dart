import 'package:flutter/material.dart';
import 'package:fnote_app/pages/home_page.dart';
import 'package:fnote_app/routes/app_routes.dart';

void main() => runApp(const MyApp());



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FNote App",
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: {
        AppRoutes.initialRoute : (context) => const HomePage(),
      },
    );
  }
}
