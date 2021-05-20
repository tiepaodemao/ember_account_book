import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ZoomButton extends StatefulWidget {
  ZoomButton(this.width,this.height,{this.child,Key key}) : super(key: key);
  double width;
  double height;
  Widget child;
  @override
  _ZoomButtonState createState() => _ZoomButtonState(this.width,this.height,child:this.child);
}

class _ZoomButtonState extends State<ZoomButton>
    with SingleTickerProviderStateMixin {
  _ZoomButtonState(this.width,this.height,{this.child});
  double width = 300;
  double height;
  Widget child;
  Animation<double> animation;
  AnimationController controller;
    
  initState() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: width, end: width*1.2).animate(controller)
      ..addListener(() {
        print("执行");
        setState(()=>{});
      });
    super.initState();
    print("ZoomButton初始化完成");
    //启动动画(正向执行)
    // controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (d){
            controller.forward();
            print("按下");
          },
          onTapUp: (d){
            controller.reverse();
            print("松开");
          },
        child: Container(
          alignment: Alignment.center,
          width: 200.w,
          // width: animation.value,
          // height: animation.value,
          child: SizeTransition(
            child: child,
            sizeFactor: animation,
            axis: Axis.horizontal,
          )
          ,
          // color: Colors.green,
        )
      );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}