import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:ta_summerstory/homeadmin.dart';
import 'package:ta_summerstory/main.dart';
import 'package:ta_summerstory/signup.dart';

import 'homepage.dart';

void dialogalert(BuildContext context, String Title) {
  showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            //title: Text("Registrasi Gagal"),

            content: Container(
              //color: Colors.blue,
              height: 225,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning,
                      size: 50,
                      color: Colors.yellow,
                    ),
                    Spacer(),
                    Text("Opss!",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(Title + "\nPlease Try Again",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                    Spacer(),
                    Container(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("TRY AGAIN"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.yellow,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5),
                            )),
                      ),
                    )
                  ]),
            ),
          ));
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future<void> _cekdata(String username, String pass) async {
      late DatabaseReference refUser =
          FirebaseDatabase.instance.ref().child("User");
      final passU = await refUser.child(username).get();
      if (passU.exists && (passU.value as dynamic)["status"] == false) {
        if (((passU.value as dynamic)["pass"]).toString() == pass) {
          Userlogged = username;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => homePage(
                        userSnapshot: passU,
                      )));
        } else {
          dialogalert(context, "Username or Password Not Valid");
        }
      } else if ((passU.value as dynamic)["status"] == true) {
        if (((passU.value as dynamic)["pass"]).toString() == pass) {
          Userlogged = "admin";
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => adminHomepage(
                        userSnapshot: passU,
                      )));
        } else {
          dialogalert(context, "Username or Password Not Valid");
        }
      } else {
        dialogalert(context, "Username or Password Not Valid");
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
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
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(
                      FontAwesome5.lock,
                      size: 16,
                    ),
                    hintText: "Password"),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (username.text.isNotEmpty && password.text.isNotEmpty) {
                    _cekdata(username.text, password.text);
                  } else {
                    dialogalert(context, "Username or Password is Empty");
                  }
                  username.clear();
                  password.clear();
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(257, 42),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: Text("LOGIN"),
              ),
              SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  child: Text("Create Your Account")),
              Spacer()
            ]),
          ),
        ));
  }
}
