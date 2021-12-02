import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Models/model_carousel_item.dart';
import 'package:portfolio_website/utils/constants.dart';

List<String> images = [
  "images/EditedHenrypfp.png",
  "images/henrypfp.png",
  "images/YellowHenrypfp.png",
  "images/YellowHenrypfp2.png",
  "images/YellowHenrypfp3.png",
];

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
                color: kCaptionColor,
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
            color: kCaptionColor,
            fontSize: 15,
            height: 1,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          decoration: BoxDecoration(
              color: kDangerColor, borderRadius: BorderRadius.circular(8)),
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
            onPressed: () {},
          ),
        ),
      ],
    )),
    image: Image.asset(
      images[index],
      fit: BoxFit.contain,
    ),
  ),
);
