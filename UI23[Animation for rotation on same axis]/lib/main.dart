import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/animation.dart';
import 'package:scratcher/scratcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Main(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(duration: Duration(seconds: 3),vsync: this);
    animation=Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context,child) {
        return Scaffold(
          body: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Transform(
                    transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.004)
                      //..rotateZ(2*pi*animation.value)
                    ..rotateZ(2*pi*animation.value),
                    alignment: Alignment.center,
                    child: Scratcher(
                      brushSize: 50,
                      threshold: 50,
                      color: Colors.grey[600],
                      child: Container(
                        height: 350,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          image: DecorationImage(
                            image: NetworkImage('https://pbs.twimg.com/media/EUPth3lU8AEe4yS?format=jpg&name=medium'),
                            fit: BoxFit.cover
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height-600,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        animationController.forward();
                      },
                      child: Text("ROTATE FRONT",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.white),),
                      color: Colors.green,
                    ),
                    SizedBox(width: 10,),
                    RaisedButton(
                      onPressed: () {
                        animationController.reverse();
                      },
                      child: Text("ROTATE REAR",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.white),),
                      color: Colors.pinkAccent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MyHomePage()
            ));
          },
          child: Text("START SHOW",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.white),),
          color: Colors.pinkAccent,
        ),
      ),
    );
  }
}


