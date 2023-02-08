import 'dart:collection';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:ta_summerstory/detailpaket.dart';
import 'package:ta_summerstory/faq.dart';
import 'package:ta_summerstory/videoyt.dart';
import 'package:youtube/youtube_thumbnail.dart';

class home extends StatelessWidget {
  late DatabaseReference promoRef =
      FirebaseDatabase.instance.ref().child("Promo");
  late DatabaseReference flashRef =
      FirebaseDatabase.instance.ref().child("Homepage/Flash");
  late DatabaseReference videopraRef =
      FirebaseDatabase.instance.ref().child("Homepage/Vpw");
  final List listPromo = [];
  final List listFlash = [];
  final List listVideoPre = [];
  Widget build(BuildContext context) {
    // TODO: implement build
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Container(
            height: 200,
            width: lebar,
            child: FutureBuilder(
              future: promoRef.get(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  listPromo.clear();
                  Map<dynamic, dynamic> values = snapshot.data.value;
                  values.forEach((key, values) {
                    listPromo.add(values);
                  });
                  final List<Widget> imageSliders = listPromo
                      .map((item) => Container(
                            child: Container(
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      Image.network(item["img"],
                                          fit: BoxFit.cover, width: 1000.0),
                                      Center(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 10.0),
                                          child: Center(
                                            child: Text(
                                              item["Judul"],
                                              style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ))
                      .toList();
                  return Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                      items: imageSliders,
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text("Flash Sale"),
          ),
          Container(
              width: double.infinity,
              child: FutureBuilder(
                  future: flashRef.get(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      listFlash.clear();
                      Map<dynamic, dynamic> values = snapshot.data.value;
                      values.forEach((key, values) {
                        listFlash.add(values);
                      });
                      return Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          for (var item in listFlash)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => detailpaket(
                                                item: item,
                                              )));
                                },
                                child: Container(
                                  height: (lebar / 3.2) - 20,
                                  width: (lebar / 2) - 20,
                                  child: Stack(children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:
                                                  NetworkImage(item["image"]))),
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
                                          item["Judul"],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            )
                        ],
                      );
                    }
                    return Container();
                  })),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text("Video Preweeding"),
          ),
          Container(
              width: double.infinity,
              child: FutureBuilder(
                future: videopraRef.get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    listVideoPre.clear();
                    Map<dynamic, dynamic> values = snapshot.data.value;
                    values.forEach((key, values) {
                      listVideoPre.add(values);
                    });
                    return Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          for (var i in listVideoPre)
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VideoPage(
                                              url: i["url"],
                                            )));
                              },
                              child: Container(
                                height: (lebar / 3.2) - 20,
                                width: (lebar / 2) - 20,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 8, color: Colors.black26)
                                    ],
                                    borderRadius: BorderRadius.circular(5)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Stack(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      YoutubeThumbnail(
                                                              youtubeId: (i[
                                                                      "url"])
                                                                  .toString()
                                                                  .replaceAll(
                                                                      "https://youtu.be/",
                                                                      ""))
                                                          .standard())))),
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
                                            i["judul"],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                        ]);
                  }
                  return Container();
                },
              )),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text("Favorite Preweeding Location"),
          ),
          Container(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (int i = 0; i < 4; i++)
                    Container(
                      height: (lebar / 3.2) - 20,
                      width: (lebar / 2) - 20,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(5)),
                    )
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => faqPage()));
              },
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange, width: 2),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.abc, size: 64),
                    SizedBox(width: 10),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("FAQ", style: TextStyle(fontSize: 10)),
                          SizedBox(height: 5),
                          Text("Privacy Police",
                              style: TextStyle(fontSize: 10)),
                          SizedBox(height: 5),
                          Text("Order Buying Guide",
                              style: TextStyle(fontSize: 10)),
                          SizedBox(height: 5),
                          Text("Payment Confirmation",
                              style: TextStyle(fontSize: 10)),
                        ]),
                    SizedBox(width: 10),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Explore Us on Social Media",
                              style: TextStyle(fontSize: 10)),
                          SizedBox(height: 5),
                          Row(children: [
                            Icon(
                              FontAwesome5.instagram,
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text("@summerstoryphotography",
                                style: TextStyle(fontSize: 10))
                          ]),
                          SizedBox(height: 5),
                          Row(children: [
                            Icon(
                              FontAwesome5.facebook,
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text("Summer Story Photography",
                                style: TextStyle(fontSize: 10)),
                          ]),
                          SizedBox(height: 5),
                          Row(children: [
                            Icon(
                              FontAwesome.mail,
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text("info@mysummerstory.com",
                                style: TextStyle(fontSize: 10))
                          ]),
                        ]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
