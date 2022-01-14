import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Models/model_footer_item.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:portfolio_website/utils/screen_config.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<FooterItem> footerItems = [
  FooterItem(
      iconPath: Icons.email_outlined,
      text: "Email",
      text2: "HenryKeene23@hotmail.com"),
  FooterItem(
      iconPath: Icons.phone_android, text: "Mobile", text2: "+447740319538")
];

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenConfig(
        desktop: _buildUi(MediaQuery.of(context).size.width, context),
        tablet: _buildUi(MediaQuery.of(context).size.width, context),
        mobile: _buildUi(MediaQuery.of(context).size.width * 0.8, context),
      ),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    return Center(
        child: ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: LayoutBuilder(builder: (_context, constraints) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 50),
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: footerItems
                            .map(
                              (footerItem) => Container(
                                height: 120,
                                width: ScreenConfig.isMobile(context)
                                    ? constraints.maxWidth / 2 - 10
                                    : constraints.maxWidth / 4 - 20,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            footerItem.iconPath,
                                            color:
                                                Theme.of(context).accentColor,
                                            size: 25,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            footerItem.text,
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      RichText(
                                        textAlign: TextAlign.start,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: "${footerItem.text2}\n",
                                                style: TextStyle(
                                                    color: kCaptionColor)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    )
                  ]);
            })));
  }
}
