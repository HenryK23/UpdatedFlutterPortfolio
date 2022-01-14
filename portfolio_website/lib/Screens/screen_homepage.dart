import 'package:flutter/material.dart';
import 'package:portfolio_website/Widgets/widget_carousel.dart';
import 'package:portfolio_website/Widgets/widget_cv_section.dart';
import 'package:portfolio_website/Widgets/widget_disclaimer.dart';
import 'package:portfolio_website/Widgets/widget_drawer.dart';
import 'package:portfolio_website/Widgets/widget_education.dart';
import 'package:portfolio_website/Widgets/widget_extras.dart';
import 'package:portfolio_website/Widgets/widget_featured_projects.dart';
import 'package:portfolio_website/Widgets/widget_featured_unreal.dart';
import 'package:portfolio_website/Widgets/widget_footer.dart';
import 'package:portfolio_website/Widgets/widget_header.dart';
import 'package:portfolio_website/utils/globals.dart';

final ScrollController? homeController = ScrollController();

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
        endDrawer: CustomDrawer(),
        body: Container(
          child: SingleChildScrollView(
            controller: homeController,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                //if you wanted sticky header then just move outside of single child scroll view
                child: Header(),
              ),
              SizedBox(
                height: 25,
              ),
              Carousel(),
              SizedBox(
                height: 50,
              ),
              Divider(
                color: Colors.white10,
                thickness: 0.3,
                height: 25,
              ),
              SizedBox(
                height: 50,
              ),
              CvSection(),
              SizedBox(
                height: 50,
              ),
              Divider(
                color: Colors.white10,
                thickness: 0.3,
                height: 25,
              ),
              FeaturedProjects(),
              SizedBox(
                height: 25,
              ),
              FeaturedUnrealProjects(),
              SizedBox(
                height: 100,
              ),
              //FeaturedUnrealProjects(),
              SizedBox(
                height: 50,
              ),
              Divider(
                color: Colors.white10,
                thickness: 0.3,
                height: 25,
              ),
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
              SizedBox(
                height: 20,
              ),
              Disclaimer(),
              SizedBox(
                height: 10,
              )
            ]),
          ),
        ));
  }
}
