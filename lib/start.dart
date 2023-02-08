import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ta_summerstory/home.dart';
import 'package:ta_summerstory/homepage.dart';

class startPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 120.0, left: 30.0),
          child: Text(
            "HI",
            style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.orange),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 160.0, left: 30.0),
          child: Text(
            "WELCOME",
            style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.orange),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 200.0, left: 30.0),
          child: Text(
            "TO",
            style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.orange),
          ),
        ),
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    scale: 1,
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.15), BlendMode.dstATop),
                    image: AssetImage("bg.png")))),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Image.asset("assets/SummerStory 4.png"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => home()));
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(257, 42),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              child: Text("START"),
            ),
          ],
        )),
      ]),
    );
  }
}
