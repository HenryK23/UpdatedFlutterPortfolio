import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Models/model_design_process.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:portfolio_website/utils/globals.dart';
import 'package:portfolio_website/utils/screen_config.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<DesignProcess> designProcess = [
  DesignProcess(
      title: "APP DEV",
      iconpath: Icons.mobile_friendly,
      subtitle: "- Android Studio\n- Java\n- Flutter\n- Firebase\n- Dart"),
  DesignProcess(
      title: "WEB DEV",
      iconpath: Icons.web,
      subtitle: "- Angular\n- HTML\n- CSS\n- Javascript\n- Flask\n- jinja2"),
  DesignProcess(
      title: ".Net",
      iconpath: Icons.window_sharp,
      subtitle: "- Core\n- API creation\n- Postman"),
  DesignProcess(
      title: "UX",
      iconpath: Icons.web_stories,
      subtitle: "- Figma\n- Axure RP\n- Photoshop"),
  DesignProcess(
      title: "GAMES DEV",
      iconpath: Icons.gamepad,
      subtitle: "- Unity\n- Unreal Engine 4\n- C#\n- Python"),
  DesignProcess(
      title: "DATA",
      iconpath: Icons.storage,
      subtitle: "- SQL\n- MongoDB\n- Databases\n- R\n- Weka"),
];

class CvSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ScreenConfig(
          desktop: _buildUi(context, 1000),
          tablet: _buildUi(context, 760),
          mobile: _buildUi(context, MediaQuery.of(context).size.width * 0.8)),
    );
  }

  downloadFile(url) {
    AnchorElement anchorElement = new AnchorElement(href: url);
    anchorElement.download = "Henry's CV";
    anchorElement.click();
  }

  Widget _buildUi(BuildContext context, double width) {
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: Text(
                    "SKILLS",
                    key: Globals.keySkills,
                    style: GoogleFonts.poppins(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(children: [
                  Container(
                      constraints: BoxConstraints(maxWidth: 100),
                      child: Text(
                        "An Ever Growing List of Technical Skills",
                        style: TextStyle(
                            color: kCaptionColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      )),
                ]),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Text(
                  "DOWNLOAD CV",
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      height: 1.8),
                ),
                onTap: () =>
                    downloadFile("assets/files/HenryKeene-CV-2021-QR-New.pdf"),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: LayoutBuilder(builder: (_context, constraints) {
              return ResponsiveGridView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                alignment: Alignment.topCenter,
                gridDelegate: ResponsiveGridDelegate(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    maxCrossAxisExtent: ScreenConfig.isTablet(context) ||
                            ScreenConfig.isMobile(context)
                        ? constraints.maxWidth / 2
                        : constraints.maxWidth / 3,
                    childAspectRatio: ScreenConfig.isDesktop(context)
                        ? 1
                        : MediaQuery.of(context).size.aspectRatio * 1),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 5,
                    color: Colors.white10,
                    child: Padding(
                      padding: EdgeInsets.all(constraints.maxWidth * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                designProcess[index].iconpath,
                                color: Theme.of(context).accentColor,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                designProcess[index].title,
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            designProcess[index].subtitle,
                            style: TextStyle(
                                color: kCaptionColor,
                                height: 1.5,
                                fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: designProcess.length,
              );
            }),
          )
        ],
      ),
    );
  }
}
