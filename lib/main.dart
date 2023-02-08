import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ta_summerstory/homepage.dart';
import 'package:ta_summerstory/loginPage.dart';
import 'package:ta_summerstory/pageexplore.dart';
import 'package:ta_summerstory/signup.dart';
import 'package:ta_summerstory/videoexplore.dart';
import 'package:ta_summerstory/videoyt.dart';

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
  runApp(const MyApp());
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
        home: LoginPage()
        //  MyHomePage(),
        );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 60),
          Image.asset("assets/SummerStory 4.png"),
          SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            style: ElevatedButton.styleFrom(
                fixedSize: Size(257, 42),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: Text("LOGIN"),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignupPage()));
            },
            style: ElevatedButton.styleFrom(
                fixedSize: Size(257, 42),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: Text("SIGN UP"),
          ),
          Spacer()
        ],
      ),
    ));
  }
}
