import 'package:flutter/material.dart';

class NormalAnimationDemo extends StatefulWidget {
  @override
  _NormalAnimationDemoState createState() => _NormalAnimationDemoState();
}

class _NormalAnimationDemoState extends State<NormalAnimationDemo>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
    
  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 300.0, end: 270.0).animate(controller)
      ..addListener(() {
        setState(()=>{});
      });
    //启动动画(正向执行)
    // controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          child: Image.asset("assets/aa.jpg",
            width: animation.value,
            height: animation.value
          ),
          onTapDown: (d){
            print(d);
            controller.forward();
          },
          onTapUp: (d){
            print(d);
            controller.reverse();
          },
        )
      )
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}