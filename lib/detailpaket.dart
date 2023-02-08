import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class detailpaket extends StatefulWidget {
  detailpaket({Key? key, required this.item}) : super(key: key);
  var item;
  State<detailpaket> createState() => detailpaketstate();
}

class detailpaketstate extends State<detailpaket> {
  int phone = 6281932216775;

  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(alignment: AlignmentDirectional.topStart, children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage(
                    widget.item["image"],
                  )),
              color: Colors.grey,
            ),
          ),
          SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 280,
                    ),
                    Container(
                      height: tinggi - 280,
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(12)),
                          boxShadow: [
                            BoxShadow(blurRadius: 12, color: Colors.black38)
                          ]),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.item["Judul"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              widget.item["Kota"],
                              style: TextStyle(color: Colors.grey),
                            ),
                            // SizedBox(height: 6),
                            Text(
                              "by : " + widget.item["by"],
                              style: TextStyle(
                                  color: Colors.orange,
                                  // fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                            SizedBox(height: 20),
                            Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            Text(
                              widget.item["day"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(height: 5),
                            Text((widget.item["detail"])
                                .toString()
                                .replaceAll("\\n", "\n")),
                            Divider(
                              height: 20,
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            Container(
                              height: 200,
                              width: double.infinity,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                    autoPlay: true,
                                    aspectRatio: 2.0,
                                    enlargeCenterPage: false,
                                    viewportFraction: 1),
                                items: [
                                  for (int p = 1; p <= 3; p++)
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(widget
                                                  .item["portofolio"]["p$p"]
                                                  .toString())),
                                          color: Colors.blueGrey,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                ],
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
                Positioned(
                    top: 250,
                    right: 25,
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.bookmark_outline,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
          Positioned(
              bottom: 20,
              child: Container(
                width: lebar - 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Harga : ",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "Rp. " +
                              (widget.item["Harga"] / 1000000).toString() +
                              "00.000",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        var whatsappUrl = "whatsapp://send?phone=${phone.toString()}" +
                            "&text=*${Uri.encodeComponent(widget.item["Judul"])}*" +
                            "%0a%0a"
                                "${widget.item["detail"].toString().replaceAll("\\n", "%0a")}";
                        try {
                          launch(whatsappUrl);
                        } catch (e) {
                          print("Unable to open whatsapp");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(180, 42),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: Text("Order Sekarang"),
                    ),
                  ],
                ),
              )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              )),
        ]),
      ),
    );
  }
}
