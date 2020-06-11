import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_button/liquid_button.dart';
import 'package:threeddmusic/home/home.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(64, 207, 104, 1),
                  image: DecorationImage(
                    image: NetworkImage('https://images.unsplash.com/photo-1500914724580-7c312c0d0f59?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.colorBurn),
                  )
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 10,sigmaX: 10),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height/4,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Welcome",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 60),),
                    Text("To",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 60),),
                    Text("Gamma",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 60),),
                    Text("Music",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 60),),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height-100,
                left: MediaQuery.of(context).size.width/10,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ));
                  },
                  child: LiquidButton(
                    height: 60,
                    width: MediaQuery.of(context).size.width-60,
                    backgroundColor: Color.fromRGBO(64, 207, 104, 1),
                    gradientColor: Colors.white30,
                    child: Text("Lets Go",style: GoogleFonts.bebasNeue(color: Colors.white,fontSize: 25),),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

