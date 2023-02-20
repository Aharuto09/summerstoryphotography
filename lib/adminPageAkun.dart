import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:ta_summerstory/homeadmin.dart';
import 'package:ta_summerstory/main.dart';

import 'loginPage.dart';

class adminHomeAccount extends StatefulWidget {
  adminHomeAccount({Key? key}) : super(key: key);

  @override
  State<adminHomeAccount> createState() => _adminAccountState();
}

class _adminAccountState extends State<adminHomeAccount> {
  DatabaseReference accountRef = FirebaseDatabase.instance.ref("User");
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    Future<void> tambahAkun(BuildContext context) async {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return addAccount();
          });
    }

    Future<void> ubahAkun(BuildContext context, DataSnapshot snapshot) async {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return editAccount(
              selectedSnaphot: snapshot,
            );
          });
    }

    // TODO: implement build
    return SafeArea(
        child: Stack(
      children: [
        FirebaseAnimatedList(
            query: accountRef,
            defaultChild: Center(child: CircularProgressIndicator()),
            shrinkWrap: false,
            padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, snapshot, animation, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: (snapshot.value as dynamic)["status"]
                        ? Color(mainOrange)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(blurRadius: 12, color: Colors.black12)
                    ]),
                child: ListTile(
                  title: Text((snapshot.value as dynamic)["firstname"] +
                      " " +
                      (snapshot.value as dynamic)["lastname"]),
                  subtitle: Text((snapshot.value as dynamic)["email"]),
                  onTap: () => ubahAkun(context, snapshot),
                  iconColor: Colors.blue,
                  trailing: IconButton(
                      onPressed: () {
                        removeItem(context, snapshot.key.toString(), "User");
                      },
                      icon: Icon(
                        FontAwesome5.trash,
                        size: 16,
                        color: (snapshot.value as dynamic)["status"]
                            ? Colors.white
                            : Color(darkGrey),
                      )),
                ),
              );
            }),
        Positioned(
          bottom: 20,
          right: 20,
          child: ElevatedButton(
              onPressed: () {
                tambahAkun(context);
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black,
                  elevation: 20,
                  backgroundColor: Color(0xfff16822),
                  fixedSize: Size(50, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Icon(
                FontAwesome5.plus,
                size: 18,
                color: Colors.white,
              )),
        ),
      ],
    ));
  }
}

class addAccount extends StatefulWidget {
  addAccount({Key? key}) : super(key: key);

  @override
  State<addAccount> createState() => _addAccountState();
}

class _addAccountState extends State<addAccount> {
  bool isSwitched = false;
  TextEditingController username = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telp = TextEditingController();
  TextEditingController pass = TextEditingController();
  Future<void> createUser(String username, String fname, String lname,
      String telp, String email, String pass, bool status) async {
    late DatabaseReference Userref = FirebaseDatabase.instance.ref("User");
    // Call the Users's CollectionReference to add a new user
    final UserCek = await Userref.child(username).get();
    // while (EventCek.exists) {
    if (UserCek.exists) {
      dialogalert(context, "Username Already Exist");
    } else {
      return Userref.child(username).set({
        "OrderHistory": "",
        "email": email,
        "firstname": fname,
        "lastname": lname,
        "pass": pass,
        "telp": telp,
        "status": status,
        "date": DateTime.now().toString()
      }).then((value) {
        print("User Added");
      }).catchError((error) => print("something error"));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      content: Container(
        height: 450,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: 450,
            child: Column(
              children: [
                Text("Tambah Akun Baru"),
                SizedBox(height: 10),
                TextField(
                    controller: username,
                    decoration: InputDecoration(
                        labelText: "Nama Pengguna",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(mainOrange)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                          controller: firstname,
                          decoration: InputDecoration(
                              labelText: "Nama Depan",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(mainOrange)),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                          controller: lastname,
                          decoration: InputDecoration(
                              labelText: "Nama Belakang",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(mainOrange)),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextField(
                    controller: telp,
                    decoration: InputDecoration(
                        labelText: "No Telp",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(mainOrange)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(height: 10),
                TextField(
                    controller: email,
                    decoration: InputDecoration(
                        labelText: "Email",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(mainOrange)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(height: 10),
                TextField(
                    controller: pass,
                    decoration: InputDecoration(
                        labelText: "Kata Sandi",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(mainOrange)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Status Admin : ",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                      activeTrackColor: Color(mainOrange),
                      activeColor: Colors.white,
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                      if (username.text.isNotEmpty ||
                          pass.text.isNotEmpty ||
                          firstname.text.isNotEmpty ||
                          lastname.text.isNotEmpty ||
                          email.text.isNotEmpty ||
                          telp.text.isNotEmpty) {
                        createUser(username.text, firstname.text, lastname.text,
                                telp.text, email.text, pass.text, isSwitched)
                            .then((value) => Navigator.pop(context));
                      } else {
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

class editAccount extends StatefulWidget {
  editAccount({Key? key, required this.selectedSnaphot}) : super(key: key);
  DataSnapshot selectedSnaphot;
  @override
  State<editAccount> createState() => _editAccountState();
}

class _editAccountState extends State<editAccount> {
  bool isSwitched = false;
  TextEditingController username = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telp = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future<void> editUser(String username, String fname, String lname,
      String telp, String email, String pass, bool status) async {
    late DatabaseReference Userref = FirebaseDatabase.instance.ref("User");
    // Call the Users's CollectionReference to add a new user
    final UserCek = await Userref.child(username).get();
    // while (EventCek.exists) {
    if (!UserCek.exists) {
      Userref.child(username).set({
        "OrderHistory": "",
        "email": email,
        "firstname": fname,
        "lastname": lname,
        "pass": pass,
        "telp": telp,
        "status": status,
        "date": (widget.selectedSnaphot.value as dynamic)["date"]
      }).then((value) =>
          Userref.child(widget.selectedSnaphot.key.toString()).remove());
    } else {
      Userref.child(widget.selectedSnaphot.key.toString()).update({
        "email": email,
        "firstname": fname,
        "lastname": lname,
        "pass": pass,
        "telp": telp,
        "status": status,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    username.text = widget.selectedSnaphot.key.toString();
    firstname.text = (widget.selectedSnaphot.value as dynamic)["firstname"];
    lastname.text = (widget.selectedSnaphot.value as dynamic)["lastname"];
    email.text = (widget.selectedSnaphot.value as dynamic)["email"];
    telp.text = (widget.selectedSnaphot.value as dynamic)["telp"];
    pass.text = (widget.selectedSnaphot.value as dynamic)["pass"];

    // TODO: implement build
    return AlertDialog(
      content: Container(
        height: 450,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: 450,
            child: Column(
              children: [
                Text("Tambah Akun Baru"),
                SizedBox(height: 10),
                TextField(
                    controller: username,
                    decoration: InputDecoration(
                        labelText: "Nama Pengguna",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(mainOrange)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                          controller: firstname,
                          decoration: InputDecoration(
                              labelText: "Nama Depan",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(mainOrange)),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                          controller: lastname,
                          decoration: InputDecoration(
                              labelText: "Nama Belakang",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(mainOrange)),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextField(
                    controller: telp,
                    decoration: InputDecoration(
                        labelText: "No Telp",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(mainOrange)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(height: 10),
                TextField(
                    controller: email,
                    decoration: InputDecoration(
                        labelText: "Email",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(mainOrange)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                SizedBox(height: 10),
                TextField(
                    controller: pass,
                    decoration: InputDecoration(
                        labelText: "Kata Sandi",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(mainOrange)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                      if (username.text.isNotEmpty ||
                          pass.text.isNotEmpty ||
                          firstname.text.isNotEmpty ||
                          lastname.text.isNotEmpty ||
                          email.text.isNotEmpty ||
                          telp.text.isNotEmpty) {
                        editUser(username.text, firstname.text, lastname.text,
                                telp.text, email.text, pass.text, isSwitched)
                            .then((value) => Navigator.pop(context));
                      } else {
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
