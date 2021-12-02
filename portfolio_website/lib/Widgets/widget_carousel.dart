import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/Widgets/widget_carousel_items.dart';
import 'package:portfolio_website/utils/screen_config.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  CarouselController carouselController = CarouselController();
  int? _index;

  @override
  Widget build(BuildContext context) {
    if (_index == null) {
      _index = 0;
    }
    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenConfig.isMobile(context) ? .7 : .85);
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
                                    carouselItems[index].image),
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
  }

  Widget _buildDesktop(BuildContext context, Widget text, Widget image) {
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

Widget _buildTablet(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: 760,
      minWidth: 760,
      defaultScale: false,
      child: Row(
        children: [
          Expanded(child: text),
          Expanded(
            child: image,
          )
        ],
      ),
    ),
  );
}

Widget _buildMobile(BuildContext context, Widget text, Widget image) {
  return Container(
    constraints:
        BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
    width: double.infinity,
    child: text,
  );
}
