import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ta_summerstory/home.dart';
import 'package:ta_summerstory/homepage.dart';
import 'package:ta_summerstory/main.dart';

class startPage extends StatefulWidget {
  startPage({Key? key, required this.userSnapshot}) : super(key: key);
  DataSnapshot userSnapshot;

  @override
  State<startPage> createState() => _startPageState();
}

class _startPageState extends State<startPage> {
  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    scale: 1,
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.80), BlendMode.dstATop),
                    image: AssetImage("assets/welcome_page.jpg")))),
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
        Positioned(
          left: 20,
          right: 20,
          top: 250,
          child: Container(
              height: lebar - 200,
              width: lebar - 200,
              child: Image.asset("assets/Logo.png")),
        ),
        Positioned(
          left: 40,
          right: 40,
          bottom: 60,
          child: ElevatedButton(
            onPressed: () {
              Userlogged = widget.userSnapshot.key.toString();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          homePage(userSnapshot: widget.userSnapshot)));
            },
            style: ElevatedButton.styleFrom(
                fixedSize: Size(257, 42),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: Text("START"),
          ),
        ),
        // Center(
        //     child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     SizedBox(height: 40),
        //     Container(
        //         height: lebar - 200,
        //         width: lebar - 200,
        //         child: Image.asset("assets/Logo.png")),
        //     Spacer(),
        //     ElevatedButton(
        //       onPressed: () {
        //         Userlogged = widget.userSnapshot.key.toString();
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) =>
        //                     homePage(userSnapshot: widget.userSnapshot)));
        //       },
        //       style: ElevatedButton.styleFrom(
        //           fixedSize: Size(257, 42),
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(50))),
        //       child: Text("START"),
        //     ),
        //     SizedBox(height: 20)
        //   ],
        // )),
      ]),
    );
  }
}
