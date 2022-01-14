import 'package:flutter/material.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: RichText(
          text: TextSpan(
              style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor, fontSize: 9),
              children: [
            TextSpan(text: "Made with "),
            TextSpan(
              text: " LOVE ",
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(text: " by Henry using "),
            TextSpan(
                text: " FLUTTER",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                    fontWeight: FontWeight.bold))
          ])),
    );
  }
}
