import 'dart:async';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Models/model_carousel_item.dart';
import 'package:portfolio_website/Provider/provider_themes.dart';
import 'package:portfolio_website/Widgets/widget_contact_page.dart';

import 'package:portfolio_website/utils/constants.dart';
import 'package:portfolio_website/utils/screen_config.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

Image yellowHenry = Image.asset("images/henryYellow2.png");
Image redHenry = Image.asset("images/henryRed2.png");
Image purpleHenry = Image.asset("images/henryPurple2.png");

Image yellowArrow = Image.asset("images/yellowarrow.png");
Image redArrow = Image.asset("images/redarrow.png");
Image purpleArrow = Image.asset("images/purplearrow.png");

List<Image> images = [
  yellowHenry,
  redHenry,
  purpleHenry,
];
List<Image> arrowImages = [yellowArrow, redArrow, purpleArrow];

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  CarouselController carouselController = CarouselController();

  int? _index;

  @override
  // ignore: must_call_super
  Future<void> didChangeDependencies() async {
    precacheImage(yellowHenry.image, context);
    precacheImage(redHenry.image, context);
    precacheImage(purpleHenry.image, context);

    precacheImage(yellowArrow.image, context);
    precacheImage(redArrow.image, context);
    precacheImage(purpleArrow.image, context);
  }

  @override
  Widget build(BuildContext context) {
    List<CarouselItemModel> carouselItems = List.generate(
      images.length,
      (index) => CarouselItemModel(
        text: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Software Developer/UX Designer",
                style: GoogleFonts.ibmPlexSerif(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            SizedBox(
              height: 2,
            ),
            Text(
              "HENRY\nKEENE",
              style: GoogleFonts.ibmPlexSans(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  height: 1.3),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Full-Stack Developer - Based in Scotland",
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 15,
                height: 1,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(20)),
              height: 48,
              child: TextButton(
                  child: Center(
                    widthFactor: 1.5,
                    child: Text(
                      "LET'S TALK!",
                      style: TextStyle(
                          color: kBackgroundColor2,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ContactPage();
                        });
                  }),
            )
          ],
        )),
        image: Container(
          child: Column(
            children: [
              Stack(children: [images[index], arrowImages[index]]),
              Container(
                padding: EdgeInsets.only(bottom: 20, right: 25),
                width: double.infinity,
                child: Text(
                  "(Click me)",
                  textAlign: TextAlign.right,
                  style: GoogleFonts.shadowsIntoLight(
                      color: Theme.of(context).accentColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (_index == null) {
      _index = 0;
    }

    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenConfig.isMobile(context) ? .7 : .85);

    return FutureBuilder(
        future: didChangeDependencies(),
        initialData: "loading",
        builder: (BuildContext context, AsyncSnapshot t) {
          return Container(
            height: carouselContainerHeight,
            width: double.infinity,
            //color: Colors.black12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                        viewportFraction: 1,
                        scrollPhysics: NeverScrollableScrollPhysics(),
                        height: carouselContainerHeight,
                      ),
                      items: List.generate(
                          5,
                          (index) => Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    constraints: BoxConstraints(
                                        minHeight: carouselContainerHeight),
                                    child: ScreenConfig(
                                      desktop: _buildDesktop(
                                        context,
                                        carouselItems[index].text,
                                        carouselItems[_index!].image,
                                      ),
                                      tablet: _buildTablet(
                                          context,
                                          carouselItems[index].text,
                                          carouselItems[_index!].image),
                                      mobile: _buildMobile(
                                          context,
                                          carouselItems[index].text,
                                          carouselItems[index].image),
                                    ),
                                  );
                                },
                              )).toList()),
                )
              ],
            ),
          );
        });
  }

  Widget _buildDesktop(BuildContext context, Widget text, Widget image) {
    var theme = Provider.of<CustomThemes>(context);
    return Center(
      child: ResponsiveWrapper(
        maxWidth: 1000,
        minWidth: 1000,
        defaultScale: false,
        child: Row(
          children: [
            Expanded(child: text),
            Expanded(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      theme.changeTheme();
                      if (_index == images.length - 1) {
                        _index = 0;
                      } else {
                        _index = _index! + 1;
                      }
                    });
                  },
                  child: image,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTablet(BuildContext context, Widget text, Widget image) {
    var theme = Provider.of<CustomThemes>(context);
    return Center(
      child: ResponsiveWrapper(
        maxWidth: 760,
        minWidth: 760,
        defaultScale: false,
        child: Row(
          children: [
            Expanded(child: text),
            Expanded(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      theme.changeTheme();
                      if (_index == images.length - 1) {
                        _index = 0;
                      } else {
                        _index = _index! + 1;
                      }
                    });
                  },
                  child: image,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



Widget _buildMobile(BuildContext context, Widget text, Widget image) {
  return Container(
    constraints:
        BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
    width: double.infinity,
    child: text,
  );
}

