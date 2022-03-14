import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Models/model_project_item.dart';
import 'package:portfolio_website/Provider/provider_projects.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:portfolio_website/utils/screen_config.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FeaturedProjects extends StatefulWidget {
  @override
  _FeaturedProjectsState createState() => _FeaturedProjectsState();
}

class _FeaturedProjectsState extends State<FeaturedProjects> {
  @override
  initState() {
    super.initState();
    Provider.of<Projects>(context, listen: false).fetchAndSetProjects();
  }

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
              child: Consumer<Projects>(
                builder: (ctx, projectData, _) => Flex(
                  direction: constraints.maxWidth > 720
                      ? Axis.horizontal
                      : Axis.vertical,
                  children: [
                    Expanded(
                        flex: constraints.maxWidth > 720 ? 1 : 0,
                        child: Container(
                          width: constraints.maxWidth * 0.3,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Image.network(
                            projectData.projectList[index!]["imagePath"],
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
                              "Flutter Projects",
                              style: GoogleFonts.poppins(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                                projectData.projectList[index!]["title"]
                                    .toString()
                                    .replaceAll("\\n", "\n"),
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
                              projectData.projectList[index!]["subtitle"]
                                  .toString()
                                  .replaceAll("\\n", "\n"),
                              style: TextStyle(
                                  color: Theme.of(context).secondaryHeaderColor,
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
                                        color: Theme.of(context).accentColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    height: 48,
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          if (index ==
                                              projectData.projectList.length -
                                                  1) {
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
                                                color: kBackgroundColor2,
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
            ),
          );
        },
      ),
    );
  }
}
