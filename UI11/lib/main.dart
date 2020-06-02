import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:ui11/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  int selectedItem=0;
  List<Widget> items = [
    DashBoardPage(),
    DashBoardPage(),
    DashBoardPage(),
    DashBoardPage(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 27, 27, 1),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(27, 27, 27, 1),
        selectedItemColor: Color.fromRGBO(239, 71, 147, 1),
        iconSize: 27,
        currentIndex: selectedItem,
        unselectedItemColor: Color.fromRGBO(113, 113, 113, 1),
        onTap: (index) {
          setState(() {
            selectedItem=index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(27, 27, 27, 1),
            icon: Icon(Icons.home),
            title: Container(
              margin: EdgeInsets.only(top: 5),
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                color: Color.fromRGBO(239, 71, 147, 1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(27, 27, 27, 1),
            icon: Icon(Icons.search),
            title: Container(
              margin: EdgeInsets.only(top: 5),
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                color: Color.fromRGBO(239, 71, 147, 1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(27, 27, 27, 1),
            icon: Icon(Icons.camera_alt),
            title: Container(
              margin: EdgeInsets.only(top: 5),
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                color: Color.fromRGBO(239, 71, 147, 1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(27, 27, 27, 1),
            icon: Icon(Icons.person),
            title: Container(
              margin: EdgeInsets.only(top: 5),
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                color: Color.fromRGBO(239, 71, 147, 1),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
      body: items[selectedItem],
    );
  }
}
