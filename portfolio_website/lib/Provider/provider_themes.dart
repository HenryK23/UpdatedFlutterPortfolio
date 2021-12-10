import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'provider_theme.dart';

class CustomThemes with ChangeNotifier {
  List<CustomTheme> _themes = [
    CustomTheme(
        primaryColor: Colors.amber[200],
        backgroundColor: Color.fromRGBO(27, 26, 23, 1),
        captionColor: Color.fromRGBO(166, 177, 187, 1),
        dangerColor: Colors.amber),
    CustomTheme(
        primaryColor: Colors.red[200],
        backgroundColor: Color.fromRGBO(27, 26, 23, 1),
        captionColor: Color.fromRGBO(166, 177, 187, 1),
        dangerColor: Colors.red),
    CustomTheme(
        primaryColor: Colors.purple[200],
        backgroundColor: Color.fromRGBO(27, 26, 23, 1),
        captionColor: Color.fromRGBO(166, 177, 187, 1),
        dangerColor: Colors.purple)
  ];
  int? index;

  CustomTheme currentTheme() {
    if (index == null) {
      index = 0;
    }
    return _themes[index!];
  }

  void changeTheme() {
    if (index == _themes.length - 1) {
      index = 0;
    } else {
      index = index! + 1;
    }
    notifyListeners();
  }
}
