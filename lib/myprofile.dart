import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  MyProfile({Key? key}) : super(key: key);
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height - 100,
                padding: EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: CircleAvatar(
                                  radius: 80,
                                  backgroundImage: AssetImage(
                                      "assets/avatar_placeholder.png"),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: FloatingActionButton(
                                      onPressed: () {},
                                      child: Icon(
                                        Icons.add,
                                        size: 20,
                                      ))),
                            ],
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: "First Name"),
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: "Last Name"),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.email), hintText: "Email"),
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            icon: Icon(Icons.phone),
                            prefixStyle: TextStyle(color: Colors.black),
                            prefix: Text("+62 "),
                            hintText: "No. Handphone"),
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
                    ])),
          ],
        ),
      ),
    );
  }
}
