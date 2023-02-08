import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class faqPage extends StatefulWidget {
  faqPage({Key? key}) : super(key: key);
  State<faqPage> createState() => _faqPageState();
}

class _faqPageState extends State<faqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.black, width: 1))),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 80,
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios),
                    SizedBox(width: 2),
                    Text("BACK")
                  ],
                ),
              )),
        ),
        Expanded(
            child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration:
                            InputDecoration(hintText: "WHY SUMMERSTORY"),
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: "HOW TO WORK"),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            hintText: "HOW TO BUY PACKET"),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(257, 42),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            child: Text("SAVE"),
                          ),
                          Spacer()
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ])))
      ]),
    );
  }
}
