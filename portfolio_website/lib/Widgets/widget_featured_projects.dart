import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Models/model_project_item.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:portfolio_website/utils/screen_config.dart';
import 'package:responsive_framework/responsive_framework.dart';

List<ProjectItems> projectItems = [
  ProjectItems(
      title: "WORKFLO\nSOLUTIONS APP",
      imagePath: "images/workflo_app.png",
      subtitle:
          "This is an app I made for a company during a summer internship. Front end was developed on flutter and the back-end was developed using firebase and postman"),
  ProjectItems(
      title: "SHOPPING\nAPP",
      imagePath: "images/ShopApp.png",
      subtitle:
          "This is a store app I had made as a personal project, you can add items to a cart and checkout. The front end was done on flutter and the back end is fully functional on firebase"),
  ProjectItems(
      title: "MENU\nAPP",
      imagePath: "images/MenuApp.png",
      subtitle:
          "This is another personal project I have done. It compiles all of your favourite recipes and sorts them. Front end was done on flutter and back end is fully functional on firebase")
];

class FeaturedProjects extends StatefulWidget {
  @override
  _FeaturedProjectsState createState() => _FeaturedProjectsState();
}

class _FeaturedProjectsState extends State<FeaturedProjects> {
  int? index;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenConfig(
        desktop: _buildUi(1000),
        tablet: _buildUi(760),
        mobile: _buildUi(MediaQuery.of(context).size.width * 0.8),
      ),
    );
  }

  Widget _buildUi(double width) {
    if (index == null) {
      index = 0;
    }
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Container(
              child: Flex(
                direction: constraints.maxWidth > 720
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  Expanded(
                      flex: constraints.maxWidth > 720 ? 1 : 0,
                      child: Container(
                        width: constraints.maxWidth * 0.3,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Image.asset(
                          projectItems[index!].imagePath,
                          fit: BoxFit.contain,
                        ),
                      )),
                  Expanded(
                      flex: constraints.maxWidth > 720 ? 1 : 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Featured Flutter Projects",
                            style: GoogleFonts.poppins(
                                color: kDangerColor2,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(projectItems[index!].title,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                height: 1.3,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            projectItems[index!].subtitle,
                            style: TextStyle(
                                color: kCaptionColor,
                                height: 1.5,
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: kDangerColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  height: 48,
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        if (index == projectItems.length - 1) {
                                          index = 0;
                                        } else {
                                          index = index! + 1;
                                        }
                                      });
                                    },
                                    child: Center(
                                        widthFactor: 1.5,
                                        child: Text(
                                          "NEXT PROJECT",
                                          style: TextStyle(
                                              color: kBackgroundColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
