import 'package:flutter/material.dart';

class Apptheme {
  static Color continuesButtonColor = Color.fromARGB(255, 57, 63, 114);
  static Color nextButtonColor = Color.fromARGB(46, 59, 98, 1);

  static TextStyle boldtitle =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
}
 Image curveImage(BuildContext context, String path) {
    return Image.asset(path,
        fit: BoxFit.fill, width: MediaQuery.of(context).size.width);
  }
