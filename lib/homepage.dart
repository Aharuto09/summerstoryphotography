import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ta_summerstory/calender.dart';
import 'package:ta_summerstory/explore.dart';
import 'package:ta_summerstory/home.dart';
import 'package:ta_summerstory/myprofile.dart';
import 'package:ta_summerstory/notifikasievent.dart';
import 'package:ta_summerstory/paket.dart';
import 'package:ta_summerstory/profile.dart';
import 'package:ta_summerstory/profilefotografer1.dart';

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
    return SafeArea(
      child: Scaffold(
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
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.black, width: 1))),
                      height: 54,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Icon(
                            Icons.abc,
                            size: 24,
                          ),
                          Spacer(),
                          Icon(Icons.person),
                          SizedBox(width: 4),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyProfile()));
                              },
                              child: Row(
                                children: [
                                  Text(
                                    ((widget.userSnapshot.value
                                            as dynamic)["firstname"])
                                        .toString(),
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    (widget.userSnapshot.value
                                        as dynamic)["lastname"],
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: Container(
                //         margin: EdgeInsets.all(10),
                //         height: 40,
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(30),
                //             boxShadow: [
                //               BoxShadow(color: Colors.black12, blurRadius: 12)
                //             ]),
                //       ),
                //     ),
                //     ElevatedButton(onPressed: () {}, child: Text("Search")),
                //     SizedBox(width: 10)
                //   ],
                // ),
                _Page.elementAt(_selectedIndex),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
