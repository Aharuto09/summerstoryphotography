import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:ta_summerstory/adminPageAkun.dart';
import 'package:ta_summerstory/adminPageCrew.dart';
import 'package:ta_summerstory/adminPageJadwal.dart';
import 'package:ta_summerstory/adminPagePaket.dart';
import 'package:ta_summerstory/adminPageRequest.dart';
import 'package:ta_summerstory/loginPage.dart';
import 'package:ta_summerstory/main.dart';

class adminHomepage extends StatefulWidget {
  adminHomepage({Key? key, required this.userSnapshot}) : super(key: key);
  DataSnapshot userSnapshot;
  @override
  State<adminHomepage> createState() => _adminHomeState();
}

class _adminHomeState extends State<adminHomepage> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _Page = <Widget>[
    adminHomePackage(),
    adminHomeCrew(),
    adminHomeAccount(),
    adminHomeSchedule(),
    adminHomeRequest()
  ];
  List<String> _title = <String>[
    "Our Items",
    "Our Crew",
    "Accounts List",
    "Event List",
    "Requext List",
  ];
  Future<void> logout() async {
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
                    child: Text("Cancel")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));

                      Userlogged = "";
                      PassLogged = "";
                    },
                    child: Text("Yes")),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xffd6d5da),
        appBar: AppBar(
          leading: Container(
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              "assets/logo.svg",
            ),
          ),
          title: Text(
            _title.elementAt(_selectedIndex),
            style: TextStyle(color: Color(mainOrange)),
          ),
          shadowColor: Colors.black26,
          backgroundColor: Colors.white,
          centerTitle: true,
          actions: [
            PopupMenuButton(
                onSelected: (value) => print(value.toString()),
                elevation: 20,
                padding: EdgeInsets.all(0),
                itemBuilder: (context) => [
                      PopupMenuItem(
                          child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                logout();
                              },
                              child: Text("Logout")))
                    ]),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                blurRadius: 12,
              ),
            ],
          ),
          child: BottomNavigationBar(
              iconSize: 24,
              showSelectedLabels: false,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Color(mainOrange),
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesome.folder,
                    size: 20,
                  ),
                  label: "Item",
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.supervisor_account,
                    ),
                    label: "Crew"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.account_box,
                      size: 22,
                    ),
                    label: "Requests"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.event,
                      size: 24,
                    ),
                    label: "Shecdule"),
                BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesome5.comment_alt,
                      size: 18,
                    ),
                    label: "Test1"),
              ]),
        ),
        body: _Page.elementAt(_selectedIndex));
  }
}

Future<void> removeItem(
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
                    FirebaseDatabase.instance.ref(_parent).child(_key).remove();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(color: Color(mainOrange)),
                  )),
            ],
          ));
}

Future<void> createItem(BuildContext context, String key) async {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
            content: Text("Are you sure ?"),
          ));
}
