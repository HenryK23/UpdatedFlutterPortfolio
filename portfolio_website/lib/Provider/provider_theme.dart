import 'package:flutter/cupertino.dart';

class CustomTheme with ChangeNotifier {
  Color? primaryColor;
  Color? backgroundColor;
  Color? dangerColor;
  Color? captionColor;

  CustomTheme(
      {this.primaryColor,
      this.backgroundColor,
      this.captionColor,
      this.dangerColor});
}
