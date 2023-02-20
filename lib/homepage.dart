import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ta_summerstory/calender.dart';
import 'package:ta_summerstory/explore.dart';
import 'package:ta_summerstory/home.dart';
import 'package:ta_summerstory/main.dart';
import 'package:ta_summerstory/myhistory.dart';
import 'package:ta_summerstory/myprofile.dart';
import 'package:ta_summerstory/notifikasievent.dart';
import 'package:ta_summerstory/paket.dart';
import 'package:ta_summerstory/profile.dart';

class homePage extends StatefulWidget {
  homePage({Key? key, required this.userSnapshot}) : super(key: key);
  DataSnapshot userSnapshot;

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _Page = <Widget>[
    home(),
    Explore(),
    profile(),
    paket(),
    schedulePage(),
  ];
  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
                        Navigator.pop(context);
                        Userlogged = "";
                        PassLogged = "";
                      },
                      child: Text("Yes")),
                ],
              ));
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          actions: [
            SizedBox(width: 5),
            IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: SvgPicture.asset("assets/logo.svg"),
              iconSize: 35,
            ),
            Spacer(),
            Center(
                child: Text(
              "Summerstory Photography",
              style: TextStyle(fontSize: 20, color: Colors.orange),
            )),
            Spacer(),
            SizedBox(width: 40)
          ],
        ),
        key: _scaffoldKey,
        drawer: Container(
          padding: EdgeInsets.all(20),
          width: lebar - 100,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.horizontal(right: Radius.circular(20))),
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
                backgroundImage: AssetImage("assets/avatar_placeholder.png"),
                backgroundColor: Colors.grey,
                maxRadius: 80,
                minRadius: 40),
            SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                Text(
                  ((widget.userSnapshot.value as dynamic)["firstname"])
                      .toString(),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 2),
                Text((widget.userSnapshot.value as dynamic)["lastname"],
                    style: TextStyle(fontSize: 20)),
              ],
            ),
            Divider(
              color: Colors.black45,
              height: 50,
              thickness: 1,
            ),
            ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyProfile()));
                },
                title: Text("Profile")),
            ListTile(onTap: () {}, title: Text("Bookmark")),
            ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHistory()));
                },
                title: Text("History")),
            Spacer(),
            TextButton(
                onPressed: () {
                  logout();
                },
                child: Row(
                  children: [Text("Logout "), Icon(Icons.logout)],
                ))
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
            iconSize: 24,
            showSelectedLabels: false,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.orange,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.movie,
                  ),
                  label: "Explore"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.people,
                  ),
                  label: "Test1"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.mark_as_unread,
                  ),
                  label: "Test1"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.message,
                  ),
                  label: "Test1"),
            ]),
        body: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  endIndent: 10,
                  indent: 10,
                ),
                _Page.elementAt(_selectedIndex),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
