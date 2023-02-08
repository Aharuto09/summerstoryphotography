import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController firstname = TextEditingController();
    TextEditingController lastname = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController telp = TextEditingController();
    TextEditingController pass = TextEditingController();
    Future<void> createUser() async {
      late DatabaseReference ref = FirebaseDatabase.instance.ref("User");
      // Call the Users's CollectionReference to add a new user

      return ref.child(username.text).set({
        "email": email.text,
        "firtsname": firstname.text,
        "lastname": lastname.text,
        "pass": pass.text,
        "telp": telp.text,
        "date": DateTime.now().toString()
      }).then((value) {
        print("User Added");
        username.clear();
        email.clear();
        pass.clear();
        telp.clear();
        firstname.clear();
        lastname.clear();
      }).catchError((error) => print("something error"));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("SIGN UP"),
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Column(children: [
              Container(
                height: 42,
                width: 257,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(blurRadius: 12, color: Colors.black12)
                    ]),
                child: Icon(
                  FontAwesome5.google,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: firstname,
                      decoration: InputDecoration(hintText: "First Name"),
                    ),
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: TextField(
                      controller: lastname,
                      decoration: InputDecoration(hintText: "Last Name"),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: username,
                decoration: InputDecoration(
                    icon: Icon(
                      FontAwesome.mail,
                      size: 16,
                    ),
                    hintText: "Username"),
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    icon: Icon(
                      FontAwesome.mail,
                      size: 16,
                    ),
                    hintText: "Email"),
              ),
              TextField(
                controller: telp,
                decoration: InputDecoration(
                    icon: Icon(
                      FontAwesome.phone,
                      size: 16,
                    ),
                    hintText: "No Hp"),
              ),
              TextField(
                controller: pass,
                decoration: InputDecoration(
                    icon: Icon(
                      FontAwesome.lock,
                      size: 16,
                    ),
                    hintText: "Password"),
              ),
              SizedBox(height: 80),
              ElevatedButton(
                onPressed: () {
                  if (username.text.isEmpty ||
                      email.text.isEmpty ||
                      pass.text.isEmpty ||
                      telp.text.isEmpty ||
                      firstname.text.isEmpty ||
                      lastname.text.isEmpty) {
                    print("Textfield in Empty");
                  } else {
                    createUser().then((value) => Navigator.pop(context));
                  }
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(257, 42),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: Text("SIGN UP"),
              ),
              Spacer()
            ]),
          ),
        ));
  }
}
