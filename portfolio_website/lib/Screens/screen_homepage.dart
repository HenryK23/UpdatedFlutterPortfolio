import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Widgets/widget_carousel.dart';
import 'package:portfolio_website/Widgets/widget_cv_section.dart';
import 'package:portfolio_website/Widgets/widget_education.dart';
import 'package:portfolio_website/Widgets/widget_extras.dart';
import 'package:portfolio_website/Widgets/widget_featured_projects.dart';
import 'package:portfolio_website/Widgets/widget_featured_unreal.dart';
import 'package:portfolio_website/Widgets/widget_footer.dart';
import 'package:portfolio_website/Widgets/widget_header.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:portfolio_website/utils/globals.dart';

class PortfolioHomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Globals
            .scaffoldKey, //This key allows for other widgets to access this state
        endDrawer: Drawer(
            // we create a drawer but no button is made to open it as this is set only on the mobile screen which is built elsewhere
            child: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 24),
              //Inside the Drawer
              //Either shows the call to action button or the navigation options
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return headerItems[index].isButton
                        //call to action button
                        ? Container(
                            decoration: BoxDecoration(
                              color: kDangerColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextButton(
                              onPressed: headerItems[index].onTap,
                              child: Center(
                                widthFactor: 0.5,
                                child: Text(
                                  headerItems[index].title,
                                  style: TextStyle(
                                      color: kBackgroundColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        //navigation options
                        : ListTile(
                            title: Text(
                              headerItems[index].title,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                  },
                  //Controls how close drawer items are to one another
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 15,
                    );
                  },
                  itemCount: headerItems.length)),
        )),
        body: Container(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                //if you wanted sticky header then just move outside of single child scroll view
                child: Header(),
              ),
              Carousel(),
              SizedBox(
                height: 6,
              ),
              CvSection(),
              FeaturedProjects(),
              SizedBox(
                height: 100,
              ),
              FeaturedUnrealProjects(),
              SizedBox(
                height: 50,
              ),
              EducationSection(),
              SizedBox(
                height: 100,
              ),
              Extras(),
              SizedBox(
                height: 100,
              ),
              Footer(),
            ]),
          ),
        ));
  }
}
