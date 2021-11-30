import 'package:flutter/material.dart';

//This queries the screen size and returns what type of screen is viewing the page

class ScreenConfig extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  ScreenConfig({Key, key, this.desktop, this.mobile, this.tablet})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth >= 1200) {
        return desktop!;
      } else if (constraints.maxWidth >= 800 && constraints.maxWidth < 1200) {
        return tablet!;
      } else
        return mobile!;
    });
  }
}
