import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'myprofile.dart';

class VideoPage extends StatefulWidget {
  VideoPage({Key? key, required this.url}) : super(key: key);
  String url;
  State<VideoPage> createState() => VideoPageState();
}

class VideoPageState extends State<VideoPage> {
  late YoutubePlayerController _ytController;
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(widget.url);
    _ytController = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: YoutubePlayerFlags(autoPlay: false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 80,
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back_ios),
                              SizedBox(width: 2),
                              Text("BACK")
                            ],
                          ),
                        )),
                    Text("Explore"),
                    Spacer()
                  ],
                ),
              ),
              Container(
                height: (lebar / 1.75) - 20,
                child: YoutubePlayer(
                  controller: _ytController,
                  showVideoProgressIndicator: true,
                  onReady: () => debugPrint("ready"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
