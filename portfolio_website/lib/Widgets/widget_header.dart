import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Models/model_header.dart';
import 'package:portfolio_website/Screens/screen_homepage.dart';
import 'package:portfolio_website/Widgets/widget_contact_page.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:portfolio_website/utils/globals.dart';
import 'package:portfolio_website/utils/screen_config.dart';
import 'package:responsive_framework/responsive_framework.dart';

List<HeaderItem> headerItems = [
  HeaderItem(title: 'SKILLS', onTap: (offset) => onPressed(offset), index: 0),
  HeaderItem(
      title: 'PORTFOLIO', onTap: (offset) => onPressed(offset), index: 1),
  HeaderItem(title: 'ABOUT ME', onTap: (offset) => onPressed(offset), index: 2),
  HeaderItem(title: 'CONTACT ME', onTap: () {}, isButton: true)
];

List<int> offsets = [1000, 2000, 3000];

void onPressed(double offset) {
  print(offset);
  homeController!.animateTo(
    offset, // change 0.0 {double offset} to corresponding widget position
    duration: Duration(seconds: 1, milliseconds: 800),
    curve: Curves.easeOut,
  );
}

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
                  text: "HK",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: ".",
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).accentColor,
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
                    ? Container(
                        height: 35,
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                            onPressed: () => {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return ContactPage();
                                      })
                                },
                            child: Center(
                              widthFactor: 1.5,
                              child: Text(
                                item.title,
                                style: TextStyle(
                                  color: kBackgroundColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                      )
                    : MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          margin: EdgeInsets.only(right: 30),
                          child: GestureDetector(
                            onTap: () => item.onTap(offsets[item.index!]),
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
      child: ScreenConfig(
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
