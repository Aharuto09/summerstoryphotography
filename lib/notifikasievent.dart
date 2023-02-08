import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ta_summerstory/calender.dart';

class notifikasievent extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Text(
            "Event Wedding Antony & Averina",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text("Westin Hotel Surabaya, Minggu 20 November 2022"),
          leading: CircleAvatar(), //awalan pada circle image
          trailing: Text("05.00 PM"),
        ),
        ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Text(
            "Event Wedding Kevin & Catherina",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text("Imperial Ballroom Surabaya, Sabtu 12 September 2022"),
          leading: CircleAvatar(), //awalan pada circle image
          trailing: Text("04.30 PM"),
        ),
        ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Text(
            "Event Wedding Yudi & Angelina",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text("Imperial Ballroom Surabaya, Sabtu 11 NOvember 2022"),
          leading: CircleAvatar(), //awalan pada circle image
          trailing: Text("05.00 PM"),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => schedulePage()));
            },
            child: Text("calender"))
      ],
    ));
  }
}
