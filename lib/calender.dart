import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class schedulePage extends StatefulWidget {
  schedulePage({Key? key}) : super(key: key);

  @override
  State<schedulePage> createState() => scheduleState();
}

class scheduleState extends State<schedulePage> {
  late DatabaseReference eventRef =
      FirebaseDatabase.instance.ref().child("event");
  List jadwal = [];
  DateTime? selectedDate;
  var judul = "Jadwal Kosong";
  String? date = "00-00-0000";
  String? lokasi = "Lokasi Kosong";

  int? tdk_ditemukan = 0;

  @override
  void initState() {
    setState(() {
      selectedDate = DateTime.now();
      date = selectedDate.toString().substring(0, 10);
      tdk_ditemukan = 0;
      if (judul != "Jadwal Kosong") {
        for (var i in jadwal) {
          if (i["date"] == date.toString()) {
            tdk_ditemukan = 1;
            judul = i["judul"];
            lokasi = i["lokasi"];
          }
          if (tdk_ditemukan == 0) {
            judul = "Jadwal Kosong";
            lokasi = "Lokasi Kosong";
          }
        }
      } else {
        Center(child: Text("Jadwal Kosong"));
      }
    });
    super.initState();
  }

  Widget build(BuildContext) {
    return FutureBuilder(
      future: eventRef.get(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          jadwal.clear();
          Map<dynamic, dynamic> values = snapshot.data.value;
          values.forEach((key, values) {
            jadwal.add(values);
          });
          return Container(
            height: 600,
            child: Column(
              children: [
                CalendarAppBar(
                  events: List.generate(jadwal.length,
                      (index) => DateTime.parse(jadwal[index]["date"])),
                  backButton: false,
                  accent: Colors.orange,
                  onDateChanged: (value) => setState(() {
                    tdk_ditemukan = 0;
                    selectedDate = value;
                    date = selectedDate.toString().substring(0, 10);
                    for (var i in jadwal) {
                      if (i["date"] == date.toString()) {
                        tdk_ditemukan = 1;
                        judul = i["judul"];
                        lokasi = i["lokasi"];
                      }
                      if (tdk_ditemukan == 0) {
                        judul = "Jadwal Kosong";
                        lokasi = "Lokasi Kosong";
                      }
                    }
                  }),
                  selectedDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 60)),
                ),
                Expanded(
                  child: Center(
                      child: Column(
                    children: [
                      if (judul != "Jadwal Kosong")
                        ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text(
                            judul.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(lokasi.toString()),
                          leading: CircleAvatar(
                              backgroundColor: Colors.orange,
                              radius: 10), //awalan pada circle image
                          trailing: Text("$date"),
                        )
                      else
                        Center(child: Text("Jadwal Kosong")),
                    ],
                  )),
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
