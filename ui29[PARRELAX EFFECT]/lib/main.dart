import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testui29/sliding_card.dart';

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

  double pageOffset=0;

  PageController _controller;
  int currentPage=1;
  List<Widget> pages=[
    Center(
      child: Icon(Icons.airplanemode_active),
    ),
    Center(
      child: Icon(Icons.account_circle),
    ),
    Center(
      child: Icon(Icons.event),
    ),
    Center(
      child: Icon(Icons.settings),
    ),

  ];

  @override
  void initState() {
    super.initState();
    _controller=PageController(viewportFraction: 0.8,initialPage: 1,keepPage: false);
    _controller.addListener(() {
      setState(() {
        pageOffset=_controller.page;
      });
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 1,
        leading: Icon(Icons.menu),
        title: Text("PageView",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          child: PageView(
            controller: _controller,
            children: <Widget>[
              SlidingCard(
                name: 'Shenzhen GLOBAL DESIGN AWARD 2018',
                date: '4.20-30',
                assetName: 'https://images.unsplash.com/photo-1596723680926-72c37f05b2ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
                offset: pageOffset,
              ),
              SlidingCard(
                name: 'Dawan District, Guangdong Hong Kong and Macao',
                date: '4.28-31',
                assetName: 'https://images.unsplash.com/photo-1465101162946-4377e57745c3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1057&q=80',
                offset: pageOffset-1,
              ),
              SlidingCard(
                name: 'Dawan District, Guangdong Hong Kong and Macao',
                date: '4.28-31',
                assetName: 'https://images.unsplash.com/photo-1444703686981-a3abbc4d4fe3?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
                offset: pageOffset-2,
              ),
              SlidingCard(
                name: 'Dawan District, Guangdong Hong Kong and Macao',
                date: '4.28-31',
                assetName: 'https://images.unsplash.com/photo-1498745289750-175b844dce53?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
                offset: pageOffset-3,
              ),
            ],
          ),
        ),
      )
    );
  }
}
