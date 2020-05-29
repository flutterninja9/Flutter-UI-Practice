import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui8/InstructorDetails.dart';
import 'package:ui8/model/instructor.dart';

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
  String _value="Santa Monica, CA";
  final instructor=allInstructors;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Color(0xFFFAF6ED),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.keyboard_backspace,size: 30,),
                Icon(Icons.menu,size: 30,),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: DropdownButton<String>(
              dropdownColor: Color(0xFFFAF6ED),
              underline: Container(
              ),
              icon: Icon(Icons.keyboard_arrow_down,size: 35,),
              value: _value,
              items: <String>["Santa Monica, CA", 'Asberia, UN', 'Detroit Park, USA'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value,style: GoogleFonts.tinos(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w500),),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  _value=val;
                });
              },
            )
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text("Best Surfing instructors in "+_value,style: GoogleFonts.sourceSansPro(fontSize: 17,color: Colors.grey[800]),),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20,left: 8,right: 8),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400]),
    ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[100]),
                ),
                hintText: "Search",
                hintStyle: GoogleFonts.tinos(fontSize: 22,color: Colors.black,fontWeight: FontWeight.w500),
                prefixIcon: Icon(Icons.search,color: Colors.black,size: 30,),
              suffixIcon: Icon(Icons.filter_list),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height-200,
            child: GridView.count(
              physics: BouncingScrollPhysics(),
              primary: false,
              crossAxisCount: 3,
              crossAxisSpacing: 1,
              childAspectRatio: 0.57,
              mainAxisSpacing: 3,
              children: <Widget>[
                  ...instructor.map((e) {
                      return buildInstructor(e);
                  }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget buildInstructor(Instructor instance) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => InstructorDetails(selectedInstructor: instance,),
        ));
      },
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              height: 180,
              width: 120,
              decoration: BoxDecoration(
              ),
            ),
            Positioned(
              top: 66,
              left: 25,
              child: Container(
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.85),
                      blurRadius: 7,
                      offset: Offset(5,25),
                      spreadRadius: 12,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 15,
                left: 10,
              child: Hero(
                tag: instance.instructorPic,
                child: Container(
                  height: 130,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.cyan,
                    image: DecorationImage(
                      image: AssetImage(instance.instructorPic),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 160,
              left: 22,
              child: Column(
                children: <Widget>[
                  Text(instance.instructorName,style: GoogleFonts.sourceSansPro(fontSize: 17,fontWeight: FontWeight.w400),),
                  SizedBox(height: 2,),
                  Row(
                    children: <Widget>[
                      Icon(Icons.star,color: Colors.grey,),
                      SizedBox(width: 5,),
                      Text(instance.rating,style: GoogleFonts.sourceSansPro(fontSize: 17,fontWeight: FontWeight.w400),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
