import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Models/model_design_process.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:portfolio_website/utils/screen_config.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<DesignProcess> designProcess = [
  DesignProcess(
      title: "APP DEV",
      imagePath: "images/Mobile.png",
      subtitle: "Android Studio, Java, XML, Flutter, Firebase, Dart"),
  DesignProcess(
      title: "WEB DEV",
      imagePath: "images/SSAS.png",
      subtitle: "HTML, CSS, SCSS, Javascript, Flask, jinja2"),
  DesignProcess(
      title: "UX",
      imagePath: "images/UXdesign.png",
      subtitle: "Figma, Axure, Photoshop"),
  DesignProcess(
      title: "GAMES DEV",
      imagePath: "images/Gamepad.png",
      subtitle: "Unity, Unreal Engine 4, C#, Python"),
  DesignProcess(
      title: "DATA",
      imagePath: "images/storage.png",
      subtitle: "SQL, MongoDB, Databases, R"),
  DesignProcess(
      title: "OFFICE",
      imagePath: "images/Microsoft.png",
      subtitle: "Word, Excel, Powerpoint"),
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

  Widget _buildUi(BuildContext context, double width) {
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "GOOD DESIGNS, \nBETTER EXPERIENCES",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    height: 1.8,
                    fontSize: 22),
              ),
              GestureDetector(
                onTap: () {},
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    "DOWNLOAD CV",
                    style: GoogleFonts.poppins(
                        color: kDangerColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        height: 1.8),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 120,
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
                        : 400,
                    childAspectRatio: ScreenConfig.isDesktop(context)
                        ? 1
                        : MediaQuery.of(context).size.aspectRatio * 1.5),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              designProcess[index].imagePath,
                              width: 40,
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
                          height: 15,
                        ),
                        Text(
                          designProcess[index].subtitle,
                          style: TextStyle(
                              color: kCaptionColor, height: 1.5, fontSize: 15),
                        )
                      ],
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
