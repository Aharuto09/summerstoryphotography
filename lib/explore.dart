import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ta_summerstory/pageexplore.dart';
import 'package:ta_summerstory/videoyt.dart';
import 'package:youtube/youtube_thumbnail.dart';

class Explore extends StatelessWidget {
  late DatabaseReference exploreRef =
      FirebaseDatabase.instance.ref().child("Explore");
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;
    List listsExplore = [];
    // TODO: implement build
    return Container(
      color: Colors.white,
      height: tinggi - 145,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.movie),
                SizedBox(width: 4),
                Text("Short"),
                Spacer()
              ],
            ),
          ),
          // Container(
          //     margin: EdgeInsets.all(12),
          //     height: 50,
          //     width: 50,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(50),
          //         boxShadow: [
          //           BoxShadow(blurRadius: 12, color: Colors.black26)
          //         ])),

          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VideoExplorePage()));
            },
            style: ElevatedButton.styleFrom(
                fixedSize: Size(lebar - 20, 42),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: Text("WATCH"),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              thickness: 1,
              color: Colors.black,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [Text("Explore"), Spacer()],
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        child: FutureBuilder(
                          future: exploreRef.get(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasData) {
                              listsExplore.clear();
                              Map<dynamic, dynamic> values =
                                  snapshot.data.value;
                              values.forEach((key, values) {
                                listsExplore.add(values);
                              });
                              return Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    for (var i in listsExplore)
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      VideoPage(
                                                        url: i["url"],
                                                      )));
                                        },
                                        child: Container(
                                          height: (lebar / 3.3) - 20,
                                          width: (lebar / 2) - 20,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 8,
                                                    color: Colors.black26)
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.network(
                                              YoutubeThumbnail(
                                                      youtubeId: (i["url"])
                                                          .toString()
                                                          .replaceAll(
                                                              "https://youtu.be/",
                                                              ""))
                                                  .standard(),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      )
                                  ]);
                            }
                            return Container();
                          },
                        )),
                    SizedBox(height: 20)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
