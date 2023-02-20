import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:ta_summerstory/profilefotografer1.dart';
import 'package:ta_summerstory/profilevideografer.dart';

class profile extends StatelessWidget {
  late DatabaseReference photographerRef =
      FirebaseDatabase.instance.ref().child("Crew/Photographer");
  late DatabaseReference videographerRef =
      FirebaseDatabase.instance.ref().child("Crew/Videographer");
  List photographer = [];
  List videographer = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;
    return Container(
      color: Color(0xfffafafa),
      height: tinggi - 145,
      width: lebar,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [Text("SUMMERSTORY TEAM'S"), Spacer()],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 200,
              padding: EdgeInsets.all(10),
              child: Text("PHOTOGRAPHER"),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 12)
                  ]),
            ),
            SizedBox(height: 20),
            Container(
                child: FutureBuilder(
              future: photographerRef.get(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  photographer.clear();
                  Map<dynamic, dynamic> values = snapshot.data.value;
                  values.forEach((key, values) {
                    photographer.add(values);
                  });
                  return Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (var i in photographer)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => profilefotografer(
                                            dataCrew: i,
                                          )));
                            },
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: 150,
                                    width: (lebar / 3) - 15,
                                    child: FadeInImage.assetNetwork(
                                        placeholder:
                                            "assets/image_placeholder.jpg",
                                        image: i["profile"],
                                        fit: BoxFit.cover,
                                        width: 1000),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    child: Text(
                                      i["Nama"],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return Container();
              },
            )),
            Container(
              alignment: Alignment.center,
              width: 200,
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.all(10),
              child: Text("VIDEOGRAPHER"),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 12)
                  ]),
            ),
            Container(
                child: FutureBuilder(
              future: videographerRef.get(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  videographer.clear();
                  Map<dynamic, dynamic> values = snapshot.data.value;
                  values.forEach((key, values) {
                    videographer.add(values);
                  });
                  return Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (var i in videographer)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => profilevideografer(
                                            dataCrew: i,
                                          )));
                            },
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: 150,
                                    width: (lebar / 3) - 15,
                                    child: FadeInImage.assetNetwork(
                                        placeholder:
                                            "assets/image_placeholder.jpg",
                                        image: i["profile"],
                                        fit: BoxFit.cover,
                                        width: 1000),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    child: Text(
                                      i["Nama"],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return Container();
              },
            )),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
