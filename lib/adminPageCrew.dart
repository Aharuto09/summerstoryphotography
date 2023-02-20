import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ta_summerstory/main.dart';

class adminHomeCrew extends StatefulWidget {
  adminHomeCrew({Key? key}) : super(key: key);

  @override
  State<adminHomeCrew> createState() => _adminCrewState();
}

class _adminCrewState extends State<adminHomeCrew> {
  late DatabaseReference pgRef =
      FirebaseDatabase.instance.ref("Crew").child("Photographer");
  late DatabaseReference vgRef =
      FirebaseDatabase.instance.ref("Crew").child("Videographer");
  final ImagePicker _picker = ImagePicker();
  Future<void> uploadFile() async {
    final XFile? _imagePick =
        await _picker.pickImage(source: ImageSource.gallery);
    print(_imagePick!.path.toString());
  }

  TextEditingController nama = TextEditingController();
  TextEditingController ig = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future<void> createCrew(String nama, String ig, String jobdesk) async {
      int _randomKey = Random().nextInt(1000);

      if (jobdesk == "Photographer") {
        return pgRef.child(_randomKey.toString()).set({
          "Nama": nama,
          "ig": ig,
          "profile":
              "https://firebasestorage.googleapis.com/v0/b/summerstorydatabase.appspot.com/o/profile%20fotografer%20dan%20videografer%2Fsstrebla.png?alt=media&token=621840b2-3064-4e30-807b-4f75703db5d3",
          "portofolio": {
            "p1":
                "https://firebasestorage.googleapis.com/v0/b/summerstorydatabase.appspot.com/o/profile%20fotografer%20dan%20videografer%2Fsstrebla.png?alt=media&token=621840b2-3064-4e30-807b-4f75703db5d3",
            "p2":
                "https://firebasestorage.googleapis.com/v0/b/summerstorydatabase.appspot.com/o/profile%20fotografer%20dan%20videografer%2Fsstrebla.png?alt=media&token=621840b2-3064-4e30-807b-4f75703db5d3",
            "p3":
                "https://firebasestorage.googleapis.com/v0/b/summerstorydatabase.appspot.com/o/profile%20fotografer%20dan%20videografer%2Fsstrebla.png?alt=media&token=621840b2-3064-4e30-807b-4f75703db5d3",
            "p4":
                "https://firebasestorage.googleapis.com/v0/b/summerstorydatabase.appspot.com/o/profile%20fotografer%20dan%20videografer%2Fsstrebla.png?alt=media&token=621840b2-3064-4e30-807b-4f75703db5d3",
            "p5":
                "https://firebasestorage.googleapis.com/v0/b/summerstorydatabase.appspot.com/o/profile%20fotografer%20dan%20videografer%2Fsstrebla.png?alt=media&token=621840b2-3064-4e30-807b-4f75703db5d3",
            "p6":
                "https://firebasestorage.googleapis.com/v0/b/summerstorydatabase.appspot.com/o/profile%20fotografer%20dan%20videografer%2Fsstrebla.png?alt=media&token=621840b2-3064-4e30-807b-4f75703db5d3",
            "p7":
                "https://firebasestorage.googleapis.com/v0/b/summerstorydatabase.appspot.com/o/profile%20fotografer%20dan%20videografer%2Fsstrebla.png?alt=media&token=621840b2-3064-4e30-807b-4f75703db5d3"
          }
        }).then((value) {
          print("Crew Added");
        });
      } else if (jobdesk == "Videographer") {
        return vgRef.child(_randomKey.toString()).set({
          "Nama": nama,
          "ig": ig,
          "profile":
              "https://firebasestorage.googleapis.com/v0/b/summerstorydatabase.appspot.com/o/profile%20fotografer%20dan%20videografer%2Fsstrebla.png?alt=media&token=621840b2-3064-4e30-807b-4f75703db5d3",
          "portofolio": {
            "p1":
                "https://firebasestorage.googleapis.com/v0/b/summerstorydatabase.appspot.com/o/profile%20fotografer%20dan%20videografer%2Fsstrebla.png?alt=media&token=621840b2-3064-4e30-807b-4f75703db5d3",
            "p2":
                "https://firebasestorage.googleapis.com/v0/b/summerstorydatabase.appspot.com/o/profile%20fotografer%20dan%20videografer%2Fsstrebla.png?alt=media&token=621840b2-3064-4e30-807b-4f75703db5d3",
            "p3":
                "https://firebasestorage.googleapis.com/v0/b/summerstorydatabase.appspot.com/o/profile%20fotografer%20dan%20videografer%2Fsstrebla.png?alt=media&token=621840b2-3064-4e30-807b-4f75703db5d3",
            "p4":
                "https://firebasestorage.googleapis.com/v0/b/summerstorydatabase.appspot.com/o/profile%20fotografer%20dan%20videografer%2Fsstrebla.png?alt=media&token=621840b2-3064-4e30-807b-4f75703db5d3",
            "p5":
                "https://firebasestorage.googleapis.com/v0/b/summerstorydatabase.appspot.com/o/profile%20fotografer%20dan%20videografer%2Fsstrebla.png?alt=media&token=621840b2-3064-4e30-807b-4f75703db5d3",
            "p6":
                "https://firebasestorage.googleapis.com/v0/b/summerstorydatabase.appspot.com/o/profile%20fotografer%20dan%20videografer%2Fsstrebla.png?alt=media&token=621840b2-3064-4e30-807b-4f75703db5d3",
            "p7":
                "https://firebasestorage.googleapis.com/v0/b/summerstorydatabase.appspot.com/o/profile%20fotografer%20dan%20videografer%2Fsstrebla.png?alt=media&token=621840b2-3064-4e30-807b-4f75703db5d3"
          }
        }).then((value) {
          print("Crew Added");
        });
      }
    }

    Future<void> addCrew(BuildContext context, String jobdesk) async {
      TextEditingController addNama = TextEditingController();
      TextEditingController addIg = TextEditingController();
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                content: Container(
                  height: 300,
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      child: Column(
                        children: [
                          Text("Tambah $jobdesk Baru"),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    //upload file profile
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.black,
                                      elevation: 20,
                                      backgroundColor: Color(darkGrey),
                                      fixedSize: Size(50, 50),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: Icon(FontAwesome5.image,
                                      color: Colors.white)),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextField(
                              controller: addNama,
                              decoration: InputDecoration(
                                  labelText: "Nama",
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
                              controller: addIg,
                              decoration: InputDecoration(
                                  labelText: "Instagram",
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Color(mainOrange)),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          SizedBox(height: 10),
                          Spacer(),
                          ElevatedButton(
                              onPressed: () {
                                // uploadFile()
                                //     .then((value) => Navigator.pop(context));
                                if (addNama.text.isNotEmpty &&
                                    addIg.text.isNotEmpty) {
                                  createCrew(addNama.text, addIg.text, jobdesk)
                                      .then((value) => Navigator.pop(context));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: Colors.red,
                                          // margin: EdgeInsets.all(5),
                                          padding: EdgeInsets.all(10),
                                          content: Container(
                                            width: double.infinity,
                                            height: 35,
                                            child: Center(
                                              child: Text(
                                                "Please make sure all fields are filled in correctly",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )));
                                }
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

    Future<void> editCrew(
        BuildContext context, String jobdesk, DataSnapshot snapshot) async {
      TextEditingController editNama = TextEditingController();
      TextEditingController editIg = TextEditingController();
      editNama.text = (snapshot.value as dynamic)["Nama"];
      editIg.text = (snapshot.value as dynamic)["ig"];

      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                content: Container(
                  height: 400,
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      child: Column(
                        children: [
                          Text("Ubah Data Anggota"),
                          SizedBox(height: 20),
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Color(lightGrey),
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 20, color: Colors.black12)
                                ],
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage((snapshot.value
                                        as dynamic)["profile"]))),
                          ),
                          SizedBox(height: 20),
                          TextField(
                              controller: editNama,
                              decoration: InputDecoration(
                                  labelText: "Nama",
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
                              controller: editIg,
                              decoration: InputDecoration(
                                  labelText: "Instagram",
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Color(mainOrange)),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          SizedBox(height: 10),
                          Spacer(),
                          ElevatedButton(
                              onPressed: () async {
                                if (jobdesk == "Photographer") {
                                  final crewCek = await pgRef
                                      .child(snapshot.key.toString())
                                      .get();

                                  // pgRef.child(snapshot.key.toString()).update(value);
                                  pgRef.child(snapshot.key.toString()).update({
                                    "Nama": editNama.text,
                                    "ig": editIg.text,
                                  }).then((value) => Navigator.pop(context));
                                } else if (jobdesk == "Videographer") {
                                  final crewCek = await vgRef
                                      .child(snapshot.key.toString())
                                      .get();
                                  vgRef.child(snapshot.key.toString()).update({
                                    "Nama": editNama.text,
                                    "ig": editIg.text,
                                  }).then((value) => Navigator.pop(context));
                                }
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
                      "Our Photographers",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          addCrew(context, "Photographer");
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
                    query: pgRef,
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
                                            as dynamic)["profile"],
                                        fit: BoxFit.cover,
                                        width: 1000,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    (snapshot.value as dynamic)["Nama"],
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
                                      onPressed: () {
                                        editCrew(
                                            context, "Photographer", snapshot);
                                      },
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
                                        removeCrew(
                                            context,
                                            snapshot.key.toString(),
                                            "Photographer");
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
                      "Our Videographers",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          addCrew(context, "Videographer");
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
                    query: vgRef,
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
                                            as dynamic)["profile"],
                                        fit: BoxFit.cover,
                                        width: 1000,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    (snapshot.value as dynamic)["Nama"],
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
                                        removeCrew(
                                            context,
                                            snapshot.key.toString(),
                                            "Videographer");
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
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> removeCrew(
    BuildContext context, String _key, String _parent) async {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
            content: Text("Are you sure ?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Color(mainOrange)),
                  )),
              TextButton(
                  onPressed: () {
                    FirebaseDatabase.instance
                        .ref("Crew")
                        .child(_parent)
                        .child(_key)
                        .remove();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(color: Color(mainOrange)),
                  )),
            ],
          ));
}
