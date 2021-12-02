import 'package:flutter/cupertino.dart';

//Set up header items

class HeaderItem {
  final String title;
  final VoidCallback onTap;
  final bool isButton;

  HeaderItem({required this.title, required this.onTap, this.isButton = false});
}
