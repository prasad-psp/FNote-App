import 'package:flutter/material.dart';
import '../res/colors.dart';

class Decorations {
  static InputDecoration getTextFieldDecoration() => const InputDecoration(
      labelStyle: TextStyle(color: Colorr.grey, fontWeight: FontWeight.bold),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colorr.grey)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)));
}
