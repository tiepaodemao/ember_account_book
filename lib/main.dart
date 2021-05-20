import 'package:ember_account_book/route/AppModule.dart';
import 'package:flutter/material.dart';
import "package:flutter_modular/flutter_modular.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'route/AppModule.dart';
void main() => runApp(ModularApp(module: AppModule(), child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,),
      initialRoute: "/",
    ).modular();
  }
}