import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Models/model_education.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:portfolio_website/utils/screen_config.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<Education> education = [
  Education(
      description: "I really enjoyed my time here",
      degree: "Honours",
      courseTitle: "Computing and User Experience",
      period: "2019-2022",
      institution: "Edinburgh Napier University"),
  Education(
      description: "I learnt a lot about teamwork and how to be an adult here",
      degree: "HNC",
      courseTitle: "Games Development",
      period: "2018-2019",
      institution: "Dundee and Angus College"),
];

class EducationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenConfig(
        desktop: _buildUi(1000),
        tablet: _buildUi(800),
        mobile: _buildUi(MediaQuery.of(context).size.width * 0.8),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Container(
      alignment: Alignment.center,
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "EDUCATION",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  height: 1.3),
            ),
            SizedBox(
              height: 5,
            ),
            Wrap(children: [
              Container(
                  constraints: BoxConstraints(maxWidth: 100),
                  child: Text(
                    "Born, Raised and Educated in Scotland",
                    style: TextStyle(
                        color: kCaptionColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )),
            ]),
            SizedBox(
              height: 40,
            ),
            LayoutBuilder(builder: (context, constraints) {
              return Container(
                child: Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: education
                        .map((education) => Container(
                              width: constraints.maxWidth / 2 - 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    education.degree,
                                    style: GoogleFonts.poppins(
                                        color: Theme.of(context).accentColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    education.courseTitle,
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    education.institution,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    education.period,
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    education.description,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: kCaptionColor, height: 1.5),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ))
                        .toList()),
              );
            })
          ],
        ),
      ),
    );
  }
}
