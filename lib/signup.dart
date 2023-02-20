import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:ta_summerstory/homepage.dart';
import 'package:ta_summerstory/loginPage.dart';
import 'package:ta_summerstory/start.dart';

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
      final passU = await ref.child(username.text).get();
      if (passU.exists) {
        dialogalert(context, "Username Not Valid or Already Exist");
      } else {
        return ref.child(username.text).set({
          "OrderHistory": "",
          "email": email.text,
          "firstname": firstname.text,
          "lastname": lastname.text,
          "pass": pass.text,
          "telp": telp.text,
          "status": false,
          "date": DateTime.now().toString()
        }).then((value) {
          print("User Added");

          email.clear();
          pass.clear();
          telp.clear();
          firstname.clear();
          lastname.clear();
        }).catchError((error) => print("something error"));
      }
    }

    Future<void> loggedin() async {
      late DatabaseReference refUser =
          FirebaseDatabase.instance.ref().child("User");
      final userSnapshot = await refUser.child(username.text).get();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => startPage(userSnapshot: userSnapshot)));
      username.clear();
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
                  SizedBox(width: 10),
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
                      FontAwesome5.user,
                      size: 16,
                    ),
                    hintText: "Username"),
              ),
              TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    icon: Icon(
                      FontAwesome.mail_alt,
                      size: 16,
                    ),
                    hintText: "Email"),
              ),
              TextField(
                controller: telp,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    icon: Icon(
                      FontAwesome.phone,
                      size: 20,
                    ),
                    hintText: "No Hp"),
              ),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(
                      FontAwesome.lock,
                      size: 20,
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
                    createUser().then((value) {
                      Navigator.pop(context);
                      loggedin();
                    });
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
