import 'package:flutter/material.dart';

import 'NormalAnimationDemo.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
         title: Text("统计"),
         centerTitle: true,
       ),
       body: Container(
         child: NormalAnimationDemo()
       ),
    );
  }
}