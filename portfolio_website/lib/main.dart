import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'Provider/provider_themes.dart';
import 'Screens/screen_homepage.dart';

void main() {
  runApp(PortfolioWebsite());
}

class PortfolioWebsite extends StatefulWidget {
  @override
  _PortfolioWebsiteState createState() => _PortfolioWebsiteState();
}

class _PortfolioWebsiteState extends State<PortfolioWebsite> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: CustomThemes())],
      child: Consumer<CustomThemes>(
        builder: (ctx, _theme, _) => MaterialApp(
          title: 'Portfolio',
          theme: ThemeData(
              primaryColor: _theme.currentTheme().primaryColor,
              scaffoldBackgroundColor: _theme.currentTheme().backgroundColor,
              canvasColor: _theme.currentTheme().backgroundColor,
              secondaryHeaderColor: _theme.currentTheme().captionColor,
              accentColor: _theme.currentTheme().dangerColor,
              textTheme: GoogleFonts.latoTextTheme()),
          // themeMode: ThemeMode.dark,
          // darkTheme: Theme.of(context).copyWith(
          //     scaffoldBackgroundColor: kBackgroundColor2,
          //     primaryColor: kPrimaryColor,
          //     canvasColor: kBackgroundColor2,
          //     textTheme: GoogleFonts.latoTextTheme()),
          //responsive wrapper is used for determining what size of screen
          builder: (context, widget) => ResponsiveWrapper.builder(
              ClampingScrollWrapper.builder(context, widget!),
              defaultScale: true,
              breakpoints: [
                ResponsiveBreakpoint.resize(450, name: MOBILE),
                ResponsiveBreakpoint.resize(800, name: TABLET),
                ResponsiveBreakpoint.resize(1000, name: TABLET),
                ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                ResponsiveBreakpoint.resize(2460, name: "4K"),
              ],
              background: Container(
                color: kBackgroundColor,
              )),
          home: PortfolioHomePage(),
        ),
      ),
    );
  }
}
