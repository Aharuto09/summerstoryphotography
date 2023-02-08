import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profilevideografer extends StatefulWidget {
  profilevideografer({Key? key, required this.dataCrew}) : super(key: key);
  var dataCrew;
  @override
  State<profilevideografer> createState() => _pvgPageState();
}

class _pvgPageState extends State<profilevideografer> {
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
                  height: 150,
                  width: (lebar / 3) - 20,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              widget.dataCrew["portofolio"]["v$p"].toString())),
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(5)),
                )
            ],
          )),
        ]),
      ),
    );
  }
}
