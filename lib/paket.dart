import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ta_summerstory/detailpaket.dart';

class paket extends StatelessWidget {
  late DatabaseReference paketRef =
      FirebaseDatabase.instance.ref().child("paket");
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;
    List lists = [];
    return Container(
        child: Column(children: [
      SizedBox(
        height: 10,
      ),
      FutureBuilder(
          future: paketRef.get(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              lists.clear();
              Map<dynamic, dynamic> values = snapshot.data.value;
              values.forEach((key, values) {
                lists.add(values);
              });
              return Column(
                children: [
                  Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        for (var i in lists)
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => detailpaket(
                                              item: i,
                                            )));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 8, color: Colors.black26)
                                    ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                      height: 200,
                                      width: (lebar / 2) - 25,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: FadeInImage.assetNetwork(
                                                  placeholder:
                                                      "assets/image_placeholder.jpg",
                                                  image: i["image"],
                                                  fit: BoxFit.cover,
                                                  width: 1000),
                                            ),
                                          ),
                                          Container(
                                            color: Colors.white,
                                            height: 50,
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  i["Judul"],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(),
                                                ),
                                                Text(
                                                  i["Kota"],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                              ))
                      ]),
                  SizedBox(
                    height: 20,
                  )
                ],
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return Text("Error");
          }),
    ]));
  }
}
