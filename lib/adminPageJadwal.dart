import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:ta_summerstory/homeadmin.dart';
import 'package:ta_summerstory/main.dart';

class adminHomeSchedule extends StatefulWidget {
  adminHomeSchedule({Key? key}) : super(key: key);

  @override
  State<adminHomeSchedule> createState() => _adminScheduleState();
}

class _adminScheduleState extends State<adminHomeSchedule> {
  DatabaseReference scheduleRef = FirebaseDatabase.instance.ref("event");

  @override
  Widget build(BuildContext context) {
    Future<void> addSchedule(BuildContext context) async {
      showDialog(
          context: context, builder: (BuildContext contextT) => addEvent());
    }

    // TODO: implement build
    return SafeArea(
        child: Stack(
      children: [
        FirebaseAnimatedList(
            query: scheduleRef,
            defaultChild: Center(child: CircularProgressIndicator()),
            shrinkWrap: false,
            padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, snapshot, animation, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(blurRadius: 12, color: Colors.black12)
                    ]),
                child: ListTile(
                  title: Text((snapshot.value as dynamic)["lokasi"]),
                  subtitle: Text((snapshot.value as dynamic)["judul"] +
                      " - " +
                      (snapshot.value as dynamic)["date"]),
                  trailing: ElevatedButton(
                      onPressed: () {
                        // FirebaseDatabase.instance
                        //     .ref("User")
                        //     .child(snapshot.key.toString())
                        //     .remove();
                        removeItem(context, snapshot.key.toString(), "event");
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          fixedSize: Size(50, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: Icon(
                        FontAwesome5.trash,
                        size: 16,
                        color: Color(darkGrey),
                      )),
                ),
              );
            }),
        Positioned(
          bottom: 20,
          right: 20,
          child: ElevatedButton(
              onPressed: () {
                addSchedule(context);
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black,
                  elevation: 20,
                  backgroundColor: Color(mainOrange),
                  fixedSize: Size(50, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Icon(
                FontAwesome5.plus,
                size: 18,
                color: Colors.white,
              )),
        )
      ],
    ));
    ;
  }
}

class addEvent extends StatefulWidget {
  addEvent({Key? key}) : super(key: key);

  @override
  State<addEvent> createState() => _addEventState();
}

class _addEventState extends State<addEvent> {
  TextEditingController title = TextEditingController();
  TextEditingController location = TextEditingController();
  DateTime? _dateTime;
  Future<void> createEvent(String title, String location, String date) async {
    late DatabaseReference Eventref = FirebaseDatabase.instance.ref("event");
    int _randomKey = Random().nextInt(1000);
    // Call the Users's CollectionReference to add a new user
    final EventCek = await Eventref.child(_randomKey.toString()).get();
    // while (EventCek.exists) {
    if (EventCek.exists) {
      _randomKey = Random().nextInt(1000);
      final EventCek = await Eventref.child(_randomKey.toString()).get();
    } else {
      return Eventref.child(_randomKey.toString()).set({
        "judul": title,
        "lokasi": location,
        "date": DateTime.now().toString().substring(0, 10)
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            // margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            content: Container(
              width: double.infinity,
              height: 35,
              child: Center(
                child: Text(
                  "Event Added",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )));
      }).catchError((error) => print("something error"));
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      content: Container(
        height: 300,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text("Tambah Jadwal Baru")),
                SizedBox(height: 20),
                TextField(
                    controller: title,
                    decoration: InputDecoration(
                        labelText: "Judul",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(mainOrange)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(height: 10),
                TextField(
                    controller: location,
                    decoration: InputDecoration(
                        labelText: "Lokasi",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(mainOrange)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(height: 10),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2099),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary:
                                          Color(mainOrange), // <-- SEE HERE
                                      onPrimary: Colors.white, // <-- SEE HERE
                                      onSurface:
                                          Color(darkGrey), // <-- SEE HERE
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        primary: Color(
                                            mainOrange), // button text color
                                      ),
                                    ),
                                  ),
                                  child: child!,
                                );
                              }).then((value) {
                            setState(() {
                              _dateTime = value;
                            });
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black,
                            elevation: 20,
                            backgroundColor: Color(mainOrange),
                            fixedSize: Size(50, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Icon(
                          Icons.event,
                          size: 24,
                          color: Colors.white,
                        )),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 50,
                        child: Center(
                          child: Text(_dateTime == null
                              ? ""
                              : _dateTime.toString().substring(0, 10)),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1, color: Colors.black26),
                            color: Color(lightGrey)),
                      ),
                    )
                  ],
                ),
                // Text(_dateTime.toString()),
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                      if (_dateTime == null ||
                          title.text.isEmpty ||
                          location.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            // margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(10),
                            content: Container(
                              width: double.infinity,
                              height: 35,
                              child: Center(
                                child: Text(
                                  "Please make sure all fields are filled in correctly",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )));
                      } else {
                        createEvent(title.text, location.text,
                                _dateTime.toString().substring(0, 10))
                            .then((value) => Navigator.pop(context));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black,
                        elevation: 20,
                        backgroundColor: Color(mainOrange),
                        fixedSize:
                            Size(MediaQuery.of(context).size.width - 20, 50),
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
    );
  }
}
