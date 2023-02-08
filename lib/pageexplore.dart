import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ta_summerstory/videoexplore.dart';

class VideoExplorePage extends StatefulWidget {
  const VideoExplorePage({Key? key}) : super(key: key);

  @override
  _VideoExplorePageState createState() => _VideoExplorePageState();
}

class _VideoExplorePageState extends State<VideoExplorePage> {
  @override
  Widget build(BuildContext context) {
    late DatabaseReference videoExploreRef =
        FirebaseDatabase.instance.ref().child("item/video");
    PageController _exploreController = PageController(initialPage: 0);
    List<Widget> _exploreItem = <Widget>[];
    return Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
          future: videoExploreRef.get(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              _exploreItem.clear();
              Map<dynamic, dynamic> values = snapshot.data.value;
              values.forEach((key, values) {
                _exploreItem.add(VideoApp(
                  urlShort: values["url"],
                  Title: values["judul"],
                ));
              });
              return Stack(
                children: [
                  Container(
                    child: PageView(
                      scrollDirection: Axis.vertical,
                      children: _exploreItem,
                      controller: _exploreController,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                        Text("Explore")
                      ],
                    ),
                  )
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            return Container();
          },
        ));
  }
}
