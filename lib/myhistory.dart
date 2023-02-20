import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHistory extends StatefulWidget {
  MyHistory({Key? key}) : super(key: key);
  State<MyHistory> createState() => _MyHistoryState();
}

class _MyHistoryState extends State<MyHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
        ),
        body: Container());
  }
}
