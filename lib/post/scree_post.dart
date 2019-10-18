import 'package:flutter/material.dart';


final primarycolor = const Color(0xffD4D7DC);
final darkcolor = const Color(0xff27282A);
final Orangecolor = const Color(0xffFF642E);
final shadowcolor = const Color(0xffA0A0A0);

class screen_post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // When the user taps the button, show a snackbar.
        Container(
          width: 150.0,
          height: 150.0,
          margin: EdgeInsets.only(top: 15.0),
          child: Ink.image(
            image: AssetImage('assets/2.png'),
            fit: BoxFit.cover,
            child: InkWell(
              onTap: () {},
            ),
          ),
        ),
        Container(
          width: 200.0,
          margin: EdgeInsets.only(top: 5.0),
          child: Text(
            "Say You Won't L.",
            style: new TextStyle(
                fontFamily: 'Schylerl', fontSize: 22.0, color: darkcolor),
          ),
        ),
        Container(
          child: Text(
            "James Arthur",
            style: new TextStyle(
                fontFamily: 'Schyler', fontSize: 15.0, color: Orangecolor),
          ),
        ),
      ],
    );
  }
}
