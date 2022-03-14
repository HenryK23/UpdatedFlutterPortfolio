import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Provider/provider_projects.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  initState() {
    super.initState();
    Provider.of<Projects>(context, listen: false).fetchAndSetCV();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      content: Container(
        width: 700,
        height: 700,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: -40.0,
              top: -40.0,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.close),
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "CONTACT ME",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 100,
                    child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              "EMAIL",
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 500,
                          height: 50,
                          child: Card(
                            elevation: 3,
                            color: Colors.white10,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.04,
                                  ),
                                  Text(
                                    "HenryKeene23@hotmail.com",
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary:
                                              Theme.of(context).accentColor),
                                      onPressed: () => {
                                            Clipboard.setData(new ClipboardData(
                                                    text:
                                                        "HenryKeene23@hotmail.com"))
                                                .then((_) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'Copied to your clipboard !',
                                                          style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .accentColor))));
                                            })
                                          },
                                      child: Icon(Icons.copy))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    height: 100,
                    child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              "MOBILE",
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 500,
                          height: 50,
                          child: Card(
                            elevation: 3,
                            color: Colors.white10,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.04,
                                  ),
                                  Text(
                                    "+44 7740 319538",
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary:
                                              Theme.of(context).accentColor),
                                      onPressed: () => {
                                            Clipboard.setData(new ClipboardData(
                                                    text: "+44 7740 319538"))
                                                .then((_) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'Copied to your clipboard !',
                                                          style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .accentColor))));
                                            })
                                          },
                                      child: Icon(Icons.copy))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    height: 100,
                    child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              "LINKEDIN",
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 500,
                          height: 50,
                          child: Card(
                            elevation: 3,
                            color: Colors.white10,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextButton(
                                style:
                                    TextButton.styleFrom(onSurface: Colors.red),
                                child: Text(
                                  "https://www.linkedin.com/in/henry-keene-a58b39211/",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () => _launchInBrowser(
                                    "https://www.linkedin.com/in/henry-keene-a58b39211/"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    height: 100,
                    child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              "GITHUB",
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 500,
                          height: 50,
                          child: Card(
                            elevation: 3,
                            color: Colors.white10,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextButton(
                                style:
                                    TextButton.styleFrom(onSurface: Colors.red),
                                child: Text(
                                  "https://github.com/HenryK23",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () => _launchInBrowser(
                                    "https://github.com/HenryK23"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    height: 100,
                    child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              "CV",
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 500,
                          height: 50,
                          child: Card(
                            elevation: 3,
                            color: Colors.white10,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextButton(
                                style:
                                    TextButton.styleFrom(onSurface: Colors.red),
                                child: Text(
                                  "View",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () => _launchInBrowser(
                                    Provider.of<Projects>(context,
                                            listen: false)
                                        .CV[0]["imagePath"]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> _launchInBrowser(String url) async {
  launch(url);
}
