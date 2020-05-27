import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Bebas',
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String btnText="READY?";

  void changeText() {
    Future.delayed(Duration(milliseconds: 3500),() {
      setState(() {
        btnText="START";
      });
    });
  }

  @override
  void initState() {
    super.initState();
    changeText();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          children: <Widget>[
            Body(),
          ],
        ),
      ),
    );
  }
}
