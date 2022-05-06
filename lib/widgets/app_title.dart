import 'package:flutter/material.dart';

import '../res/colors.dart';

class AppTitle extends StatelessWidget {
  final String title, subtitle;

  const AppTitle({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colorr.amber),
          textScaleFactor: 2.0,
        ),
        const SizedBox(height: 5.0),
        Text(
          subtitle,
          style: const TextStyle(
              color: Colorr.lightPurple, fontWeight: FontWeight.w500),
          textScaleFactor: 1.5,
        )
      ],
    );
  }
}
