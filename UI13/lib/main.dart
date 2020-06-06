import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:ui13/detailPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion Heroes',
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
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.deepOrange));
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentIndex=index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/home.svg'),
            title: Container(
              margin: EdgeInsets.only(top: 4),
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/square.svg'),
            title: Container(
              margin: EdgeInsets.only(top: 4),
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/search.svg'),
            title: Container(
              margin: EdgeInsets.only(top: 4),
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/circle.svg'),
            title: Container(
              margin: EdgeInsets.only(top: 4),
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
           mainPage(image: 'https://images.unsplash.com/photo-1538331269258-6c97a6bdeae0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',title:"Louis W. & A.P.C.",subtitleA: "Drop a Chic Selection of Outerwear",subtitleB:"For 2019 Spring/Summer"  ,tag:1),
           mainPage(image: 'https://images.unsplash.com/photo-1585003489790-29594757d64e?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',title:"Mt. Carolina",subtitleA: "New Visuals",subtitleB:"For P.O.W.A" ,tag:2 ),
           mainPage(image: 'https://images.unsplash.com/photo-1516522973472-f009f23bba59?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',title:"Adidas Originals",subtitleA: "Get Ready For the Summer",subtitleB:"and Your Sports Life"  ,tag:3),
        ],
      ),
    );
  }

  Widget mainPage({image,title,subtitleA,subtitleB,tag}) {
    return Container(
      height: (MediaQuery.of(context).size.height)/1.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(title,style: GoogleFonts.quicksand(color: Colors.white,fontSize: 45,height: 2),),
              Text(subtitleA,style: GoogleFonts.quicksand(color: Colors.white,fontSize: 20),),
              SizedBox(height: 4,),
              Text(subtitleB,style: GoogleFonts.quicksand(color: Colors.white,fontSize: 20),),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:20.0),
            child: FloatingActionButton(
              heroTag: "tag"+tag.toString(),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(),
                ));
              },
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_forward,color: Colors.black,),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }

}
