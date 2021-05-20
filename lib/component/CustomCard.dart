import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: must_be_immutable
class CustomCard extends StatelessWidget{
  CustomCard(
    {Key key,this.width,this.height,this.color,
    this.padding,this.margin, this.onTap,
    this.borderRadius,this.child}) : super(key: key);
  double width = ScreenUtil().setWidth(50);
  Color color;
  double height = ScreenUtil().setWidth(100);
  EdgeInsets padding = EdgeInsets.all(ScreenUtil().setWidth(50));
  EdgeInsets margin = EdgeInsets.zero;
  BorderRadius borderRadius =BorderRadius.all(Radius.circular(ScreenUtil().setWidth(20)));
  Widget child;
  GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap ?? (){},
      child: Container(
        width: this.width,
        height: this.height,
        padding: this.padding,
        margin: this.margin,
        child: this.child,
        decoration: BoxDecoration(
          color:color ?? Colors.white,
          // borderRadius: this.borderRadius,
          borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(30))),
          boxShadow: [BoxShadow(
            color: Color.fromRGBO(220, 220, 220, 1),
            offset: Offset(0.0, 0.0), //阴影xy轴偏移量
            blurRadius: ScreenUtil().setWidth(10), //阴影模糊程度
            spreadRadius: ScreenUtil().setWidth(1) //阴影扩散程度
            )],
        ),
      )
    );
  }
}