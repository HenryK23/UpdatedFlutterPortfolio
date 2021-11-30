import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Models/model_header.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:portfolio_website/utils/globals.dart';
import 'package:portfolio_website/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

List<HeaderItem> headerItems = [
  HeaderItem(title: 'ABOUT ME', onTap: () {}),
  HeaderItem(title: 'SKILLS', onTap: () {}),
  HeaderItem(title: 'PORTFOLIO', onTap: () {}),
  HeaderItem(title: 'CONTACT ME', onTap: () {}, isButton: true)
];

class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "HK.",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold))
            ]),
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
        visible: false,
        visibleWhen: [Condition.largerThan(name: MOBILE)],
        child: Row(
            children: headerItems
                .map((item) => item.isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: TextButton(
                              onPressed: item.onTap,
                              child: Text(
                                item.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                      )
                    : MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          margin: EdgeInsets.only(right: 30),
                          child: GestureDetector(
                            onTap: item.onTap,
                            child: Text(
                              item.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ))
                .toList()));
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
          desktop: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: BuildHeader(),
          ),
          mobile: buildMobileHeader(),
          tablet: BuildHeader()),
    );
  }
}

//Mobile Header
Widget buildMobileHeader() {
  return SafeArea(
      child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeaderLogo(),
        GestureDetector(
            onTap: () {
              Globals.scaffoldKey.currentState!.openEndDrawer();
            },
            child: Icon(Icons.menu_rounded, color: Colors.white, size: 28))
      ],
    ),
  ));
}

Widget BuildHeader() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      HeaderLogo(),
      HeaderRow(),
    ]),
  );
}
