import 'dart:math';

import 'package:ember_account_book/style/Style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'component/CustomCard.dart';
import "component/AnimatedButton.dart";
import 'component/ZoomButton.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int touchedIndex;
  List list = [1,2,3,4,5];
  randomColor(){
    List<Color> c = [
      Colors.red,Colors.blue,Colors.green,Colors.grey,
      Colors.orange,Colors.greenAccent,Colors.redAccent,Colors.purple,
      Colors.pink,Colors.brown,Colors.blueGrey,Colors.yellow];
    return c[Random().nextInt(c.length)];
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
      appBar: AppBar(
        title: Text("总览"),
        centerTitle: true,
        backgroundColor: C.themeColor,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: C.themeColor,
        child: Icon(
          Icons.add,
          color: Colors.white
        ),
        onPressed: (){

        },
      ),
      body: Container(
        color: C.baColor,
        padding: EdgeInsets.all(7.w),
        child: ListView(
          children: [
             Column(
              children: [
                search(),
                SizedBox(height: 7.w,),
                statistics(),
                SizedBox(height: 7.w,),
                capital(),
                Container(
                  width: 100.w,
                  height: 100.h,
                  color: Colors.blue,
                ),
                SizedBox(
                  // width: 200.w,
                  // height: 200.h,
                  // color: Colors.red,
                  child: ZoomButton(
                    250.w,300.h,
                    child: Container(
                      width: 100.w,
                      height: 100.w,
                      color: Colors.red,
                    )
                  )
                )
              ],
            ) 
          ],
        )
      ),
    );
  }
  // 搜索
  Widget search(){
    return Container(
      height: 35.h,
      alignment: Alignment.center,
      child: Text("搜索",style: TextStyle(color: C.textGrayColor)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(40.w)),
      )
    );
  }
  // 统计 
  Widget statistics(){
    return customCard(
      height: 200.h,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child:Container(
            //   child: AspectRatio(
            //     aspectRatio: 1.3,
            //     child: AspectRatio(
            //       aspectRatio: 1,
            //       child: PieChart(
            //         PieChartData(
            //           pieTouchData: PieTouchData(
            //             enabled: false,
            //             touchCallback: (pieTouchResponse) {
            //               setState(() {
            //                 final desiredTouch = pieTouchResponse.touchInput is! PointerExitEvent &&
            //                     pieTouchResponse.touchInput is! PointerUpEvent;
            //                 if (desiredTouch && pieTouchResponse.touchedSection != null) {
            //                   touchedIndex = pieTouchResponse.touchedSection.touchedSectionIndex;
            //                 } else {
            //                   touchedIndex = -1;
            //                 }
            //               }
            //             );
            //           }),
            //           borderData: FlBorderData(
            //             show: false,
            //           ),
                      
            //           sectionsSpace: 0,
            //           centerSpaceRadius: 0,
            //           sections: showingSections2(),
            //         )
            //       )
            //     )
            //   )
            )
          ),
          SizedBox(width: 10.w,),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: this.list.map((e) {
                  return Row(
                    children: [
                      Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          color: randomColor(),
                          borderRadius: BorderRadius.all(Radius.circular(3.w)),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Text("${e}",style: TextStyle(color: C.textGrayColor))
                    ],
                  );
                }).toList(),
              ),
            )
          )
        ],
      ),
    );
  }
  // 剩余 和 支出
  Widget capital(){
    return Container(
      height: 100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: customCard(
              child: Text("剩余",style: TextStyle(color: C.textGrayColor))
            ),
          ),
          SizedBox(width: 7.w,),
          Expanded(
            flex: 1,
            child: customCard(
              child: Text("支出",style: TextStyle(color: C.textGrayColor))
            )
          )
        ],
      )
    );
  }
  // 卡片
  // 
  Widget customCard({width,height,child,onTap}){
    return Container(
      width: width ?? 0,
      height:height ?? 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        boxShadow: [BoxShadow(
          color: Color.fromRGBO(239, 242, 237, 1),
          offset: Offset(0.0, 0.0), //阴影xy轴偏移量
          blurRadius: ScreenUtil().setWidth(5.w), //阴影模糊程度
          spreadRadius: ScreenUtil().setWidth(1.w) //阴影扩散程度
          )],
      ),
      child: FlatButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.w))
        ),
        color: C.cardColor,
        child: child ?? Container(),
        onPressed: onTap ?? (){}
      ),
    );
  }
  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 20.sp : 12.sp;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
  List<PieChartSectionData> showingSections2() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 20 : 16;
      final double radius = isTouched ? 70.w : 70.w;
      final double widgetSize = isTouched ? 49 : 30;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/aa.jpg',
              size: widgetSize,
              borderColor: const Color(0xff0293ee),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/aa.jpg',
              size: widgetSize,
              borderColor: const Color(0xfff8b250),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 16,
            title: '16%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/aa.jpg',
              size: widgetSize,
              borderColor: const Color(0xff845bef),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/aa.jpg',
              size: widgetSize,
              borderColor: const Color(0xff13d38e),
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          return null;
      }
    });
  }
}
class _Badge extends StatelessWidget {
  final String svgAsset;
  final double size;
  final Color borderColor;

  const _Badge(
    this.svgAsset, {
    Key key,
    @required this.size,
    @required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: SvgPicture.asset(
          svgAsset,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}