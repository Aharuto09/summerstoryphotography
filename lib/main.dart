import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ta_summerstory/homeadmin.dart';
import 'package:ta_summerstory/loginPage.dart';
import 'package:ta_summerstory/start.dart';

String Userlogged = "";
String PassLogged = "";
int mainOrange = 0xfff16822;
int subOrange = 0xffb14b26;
int darkGrey = 0xff1a1a1a;
int lightGrey = 0xffd6d5da;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBGG0779zWYQsBjMOjP-75P0oXZBK7PK6w",
          appId: "1:603353560536:web:de1746d57cb2c7f29a6ead",
          databaseURL:
              "https://summerstorydatabase-default-rtdb.asia-southeast1.firebasedatabase.app/",
          messagingSenderId: "603353560536",
          projectId: "summerstorydatabase",
          measurementId: "G-Q6FLR1PF8D"));
  Future<void> loggedin() async {
    late DatabaseReference refUser =
        FirebaseDatabase.instance.ref().child("User");
    final userSnapshot = await refUser.child(Userlogged).get();
    if (userSnapshot.exists &&
        (userSnapshot.value as dynamic)["pass"] == PassLogged) {
      if ((userSnapshot.value as dynamic)["status"]) {
        runApp(MyLoggedApp(
          userSnapshot: userSnapshot,
          statusAdmin: (userSnapshot.value as dynamic)["status"],
        ));
      } else {
        runApp(MyLoggedApp(
          userSnapshot: userSnapshot,
          statusAdmin: (userSnapshot.value as dynamic)["status"],
        ));
      }
    } else {
      runApp(MyApp());
    }
  }

  if (Userlogged != "") {
    loggedin();
  } else {
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: LoginPage());
  }
}

class MyLoggedApp extends StatefulWidget {
  MyLoggedApp({Key? key, required this.userSnapshot, required this.statusAdmin})
      : super(key: key);
  DataSnapshot userSnapshot;
  bool statusAdmin;

  @override
  State<MyLoggedApp> createState() => myLoggedState();
}

class myLoggedState extends State<MyLoggedApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: widget.statusAdmin
          ? adminHomepage(userSnapshot: widget.userSnapshot)
          : startPage(userSnapshot: widget.userSnapshot),
    );
  }
}
