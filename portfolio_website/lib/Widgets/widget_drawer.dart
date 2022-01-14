import 'package:flutter/material.dart';
import 'package:portfolio_website/Widgets/widget_contact_page.dart';
import 'package:portfolio_website/Widgets/widget_header.dart';
import 'package:portfolio_website/utils/constants.dart';

List<int> offsets = [800, 2300, 3750];

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                          onPressed: () => {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ContactPage();
                                })
                          },
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
                        onTap: () => {
                              headerItems[index].onTap(offsets[index]),
                              Navigator.pop(context),
                            });
              },
              //Controls how close drawer items are to one another
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 15,
                );
              },
              itemCount: headerItems.length)),
    ));
  }
}
