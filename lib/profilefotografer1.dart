import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profilefotografer extends StatefulWidget {
  profilefotografer({Key? key, required this.dataCrew}) : super(key: key);
  var dataCrew;
  @override
  State<profilefotografer> createState() => _pfgPageState();
}

class _pfgPageState extends State<profilefotografer> {
  PageController _exploreController = PageController(initialPage: 0);
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(children: [
          // SizedBox(height: 20),
          CircleAvatar(
            backgroundImage: NetworkImage(widget.dataCrew["profile"]),
            radius: 80,
          ),
          SizedBox(height: 10),
          Text(
            widget.dataCrew["Nama"],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.dataCrew["ig"],
            style: TextStyle(color: Colors.black54),
          ),
          SizedBox(height: 20),
          Container(
              child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (int p = 1; p <= 3; p++)
                Container(
                  height: (lebar / 4) - 20,
                  width: (lebar / 3) - 20,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              widget.dataCrew["portofolio"]["p$p"].toString())),
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(5)),
                ),
              Container(
                width: lebar - 40,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: false,
                      viewportFraction: 1),
                  items: [
                    for (int p = 4; p <= 7; p++)
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(widget
                                    .dataCrew["portofolio"]["p$p"]
                                    .toString())),
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                  ],
                ),
              )
            ],
          )),
        ]),
      ),
    );
  }
}
