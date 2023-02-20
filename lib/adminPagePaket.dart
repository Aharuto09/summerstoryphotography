import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:ta_summerstory/homeadmin.dart';
import 'package:ta_summerstory/main.dart';
import 'package:youtube/youtube_thumbnail.dart';

class adminHomePackage extends StatefulWidget {
  adminHomePackage({Key? key}) : super(key: key);

  @override
  State<adminHomePackage> createState() => _adminPackageState();
}

class _adminPackageState extends State<adminHomePackage> {
  late DatabaseReference paketRef = FirebaseDatabase.instance.ref("paket");
  late DatabaseReference exploreRef = FirebaseDatabase.instance.ref("Explore");
  @override
  Widget build(BuildContext context) {
    Future<void> addPackage(BuildContext context) async {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                content: Container(
                  height: 750,
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      height: 750,
                      child: Column(
                        children: [
                          Text("Tambah Paket Baru"),
                          SizedBox(height: 20),
                          TextField(
                              decoration: InputDecoration(
                                  labelText: "Gambar Utama",
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Color(mainOrange)),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          SizedBox(height: 10),
                          TextField(
                              decoration: InputDecoration(
                                  labelText: "Judul",
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Color(mainOrange)),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          SizedBox(height: 10),
                          TextField(
                              decoration: InputDecoration(
                                  labelText: "Kota",
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Color(mainOrange)),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          SizedBox(height: 10),
                          TextField(
                              decoration: InputDecoration(
                                  labelText: "Berapa Hari ?",
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Color(mainOrange)),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          SizedBox(height: 10),
                          TextField(
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.top,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  labelText: "Detail",
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Color(mainOrange)),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          SizedBox(height: 10),
                          TextField(
                              decoration: InputDecoration(
                                  labelText: "Oleh",
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Color(mainOrange)),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 52,
                                width: 52,
                                decoration: BoxDecoration(
                                    color: Color(lightGrey),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  children: [
                                    TextField(
                                        decoration: InputDecoration(
                                            labelText: "Portofolio 1",
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Color(mainOrange)),
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)))),
                                    SizedBox(height: 10),
                                    TextField(
                                        decoration: InputDecoration(
                                            labelText: "Portofolio 2",
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Color(mainOrange)),
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)))),
                                    SizedBox(height: 10),
                                    TextField(
                                        decoration: InputDecoration(
                                            labelText: "Portofolio 3",
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Color(mainOrange)),
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)))),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.black,
                                  elevation: 20,
                                  backgroundColor: Color(mainOrange),
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width - 20,
                                      50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Simpan",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ])),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
    }

    Future<void> addExplore(BuildContext context) async {
      TextEditingController addUrl = TextEditingController();
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                content: Container(
                  width: double.infinity,
                  height: 100,
                  child: Column(
                    children: [
                      Text("Add New Video Explore"),
                      SizedBox(height: 20),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                    child: TextField(
                                        controller: addUrl,
                                        decoration: InputDecoration(
                                            labelText: "url",
                                            hintText: "https://youtu.be/xxxxxx",
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Color(mainOrange)),
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)))))),
                            SizedBox(width: 5),
                            ElevatedButton(
                                onPressed: () {
                                  int _randomKey = Random().nextInt(1000);
                                  exploreRef
                                      .child(_randomKey.toString())
                                      .set({"url": addUrl.text}).then(
                                          (value) => Navigator.pop(context));
                                },
                                style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.black,
                                    elevation: 20,
                                    backgroundColor: Color(darkGrey),
                                    fixedSize: Size(50, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: Icon(
                                  FontAwesome.plus,
                                  size: 16,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ));
    }

    // TODO: implement build
    return Container(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Row(
                  children: [
                    Text(
                      "Our Package List",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          addPackage(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(mainOrange),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: Text(
                          "Tambah",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
              Container(
                height: 300,
                child: FirebaseAnimatedList(
                    query: paketRef,
                    defaultChild: Center(child: CircularProgressIndicator()),
                    shrinkWrap: false,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, snapshot, animation, index) {
                      return Stack(
                        children: [
                          Container(
                            width: 200,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(
                                bottom: 20, left: 5, right: 5, top: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 12, color: Colors.black26)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      child: FadeInImage.assetNetwork(
                                        placeholder:
                                            "assets/image_placeholder.jpg",
                                        image: (snapshot.value
                                            as dynamic)["image"],
                                        fit: BoxFit.cover,
                                        width: 1000,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    (snapshot.value as dynamic)["Judul"],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Container(height: 20)
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(darkGrey),
                                          fixedSize: Size(120, 50),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FontAwesome.pencil,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            "Edit",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      )),
                                  SizedBox(width: 5),
                                  ElevatedButton(
                                      onPressed: () {
                                        removeItem(context,
                                            snapshot.key.toString(), "paket");
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(mainOrange),
                                          fixedSize: Size(50, 50),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: Icon(
                                        FontAwesome5.trash,
                                        size: 16,
                                        color: Colors.white,
                                      )),
                                ],
                              )),
                        ],
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Row(
                  children: [
                    Text(
                      "Our Explore List",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          addExplore(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(mainOrange),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: Text(
                          "Tambah",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
              Container(
                height: 150,
                child: FirebaseAnimatedList(
                    query: exploreRef,
                    defaultChild: Center(child: CircularProgressIndicator()),
                    shrinkWrap: false,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, snapshot, animation, index) {
                      return Stack(
                        children: [
                          Container(
                            width: 200,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(
                                bottom: 20, left: 5, right: 5, top: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 12, color: Colors.black26)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      child: FadeInImage.assetNetwork(
                                          placeholder:
                                              "assets/image_placeholder.jpg",
                                          image: YoutubeThumbnail(
                                                  youtubeId: ((snapshot.value
                                                          as dynamic)["url"])
                                                      .toString()
                                                      .replaceAll(
                                                          "https://youtu.be/",
                                                          ""))
                                              .standard(),
                                          fit: BoxFit.cover,
                                          width: 1000),
                                    ),
                                  ),
                                ),
                                // Container(height: 30)
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            // top: 0,
                            // left: 0,
                            right: 15,
                            child: ElevatedButton(
                                onPressed: () {
                                  removeItem(context, snapshot.key.toString(),
                                      "Explore");
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(mainOrange),
                                    fixedSize: Size(50, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: Icon(
                                  FontAwesome5.trash,
                                  size: 16,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
