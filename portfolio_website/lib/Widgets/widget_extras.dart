import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Models/model_extras.dart';
import 'package:portfolio_website/Provider/provider_themes.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:portfolio_website/utils/screen_config.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<ExtrasList> extrasList = [
  ExtrasList(
      title: "Whisky Collector",
      description:
          "I have been collecting whisky for a few years now. My favourite would have to be Cragganmore or Dalwhinnie"),
  ExtrasList(
      title: "Philosophy",
      description:
          "In my spare time I love reading and learning about philosophy. Some of my favourites include Henri Bergson and Edmund Burke")
];

List<String> images = [
  "images/henryYellow2.png",
  "images/henryRed2.png",
  "images/henryPurple2.png",
];

class Extras extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int index = Provider.of<CustomThemes>(context).index!;
    return Container(
      child: ScreenConfig(
        desktop: _buildUi(1000, context, images[index]),
        tablet: _buildUi(720, context, images[index]),
        mobile:
            _buildUi(MediaQuery.of(context).size.width, context, images[index]),
      ),
    );
  }

  Widget _buildUi(width, context, image) {
    return Container(
      alignment: Alignment.center,
      child: ResponsiveWrapper(
        minWidth: width,
        maxWidth: width,
        defaultScale: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("EXTRAS ABOUT ME",
                style: GoogleFonts.poppins(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            Wrap(children: [
              Container(
                  constraints: BoxConstraints(maxWidth: 100),
                  child: Text(
                    "For when i'm not on my computer",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )),
            ]),
            SizedBox(
              height: 50,
            ),
            LayoutBuilder(builder: (context, constraints) {
              return Container(
                child: Flex(
                  direction: constraints.maxWidth > 720
                      ? Axis.horizontal
                      : Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Image.asset(
                          image,
                          fit: BoxFit.contain,
                          scale: 7,
                        )),
                    Wrap(
                      spacing: 50,
                      runSpacing: 50,
                      children: extrasList
                          .map((extras) => Container(
                                width: constraints.maxWidth / 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      extras.title,
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      extras.description,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        height: 1.5,
                                      ),
                                    )
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
