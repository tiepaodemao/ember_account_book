import 'package:ember_account_book/Detail.dart';
import 'package:ember_account_book/Home.dart';
import 'package:ember_account_book/Mine..dart';
import 'package:ember_account_book/style/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'NormalAnimationDemo.dart';

class Tab extends StatefulWidget {
  Tab({Key key}) : super(key: key);

  @override
  _TabState createState() => _TabState();
}

class _TabState extends State<Tab> {
  int currentIndex = 0;
  List<Widget> _pageList = [
    HomePage(),
    NormalAnimationDemo(),
    MinePage()
  ];
  routerBeforeEach(index){
    setState(() {
      this.currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(315, 700),
      orientation: Orientation.portrait
    );
    return Scaffold(
      backgroundColor: C.baColor,
      body: IndexedStack(
        index: currentIndex,
        children: this._pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20.0,
        // unselectedItemColor: myFontColor,
        // selectedItemColor: myGoldenAccent,
        elevation: 1,
        // backgroundColor: myBackgroundColorAccent,
        currentIndex: this.currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: routerBeforeEach,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), title: Text("总览")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), title: Text("统计")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), title: Text("我的")
          ),
        ],
      )
    );
  }
}