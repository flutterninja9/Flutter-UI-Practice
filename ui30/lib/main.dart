import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

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
  String selectedText="info";
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 237, 240,1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(247, 237, 240,1),
        elevation: 0,
        leading: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(249, 128, 174, 1),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(12)),
          ),
          child: Center(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 8,right: 15),
            child: Icon(Icons.assessment,color: Colors.grey[700],size: 35,),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 35,left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tony & Guy",style: GoogleFonts.poppins(fontSize: 38,fontWeight: FontWeight.w700,color: Color.fromRGBO(51,51,127,1)),),
                        Row(
                          children: [
                            Text("Jumeria Lake Towers",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w400,color: Color.fromRGBO(51,51,127,1)),),
                            SizedBox(width: 8,),
                            Container(
                              height: 20,
                              width: 2,
                              color: Color.fromRGBO(51,51,127,1),
                            ),
                            SizedBox(width: 8,),
                            Text("Unisex",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w400,color: Color.fromRGBO(51,51,127,1)),),
                          ],
                        ),
                        Container(
                          height: 260,
                          margin: EdgeInsets.only(right: 25,top: 40),
                          width: double.infinity,
                          color: Color.fromRGBO(247, 237, 240,1),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Choose a service",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500,color: Color.fromRGBO(51,51,127,1)),),
                                  Text("See All",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w400,color: Color.fromRGBO(51,51,127,1)),),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                height: 180,
                                width: double.infinity,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                       headers(image: 'assets/barber.png',title: 'Barber',price: '\$10'),
                                       headers(image: 'assets/msg.png',title: 'Massage',price: '\$20'),
                                       headers(image: 'assets/spa.png',title: 'Spa',price: '\$25'),
                                       headers(image: 'assets/manicure.png',title: 'Manicure',price: '\$70'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 300,
                          margin: EdgeInsets.only(right: 25,top: 0,bottom: 40),
                          width: double.infinity,
                          color: Color.fromRGBO(247, 237, 240,1),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Photos",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500,color: Color.fromRGBO(51,51,127,1)),),
                                  Text("See All",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w400,color: Color.fromRGBO(51,51,127,1)),),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                height: 200,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 200,
                                      width: 150,
                                      margin: EdgeInsets.only(top: 10,right: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                                        image: DecorationImage(
                                          image: NetworkImage('https://images.unsplash.com/photo-1517832606299-7ae9b720a186?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=333&q=80'),
                                       fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 90,
                                          width: 150,
                                          margin: EdgeInsets.only(top: 10,bottom: 10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage('https://images.unsplash.com/photo-1544161515-4ab6ce6db874?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80')
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 90,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage('https://images.unsplash.com/photo-1570174006382-148305ce4972?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80')
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height-152,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                margin: EdgeInsets.only(left: 8,right: 10,top: 20,bottom: 10),
                width: MediaQuery.of(context).size.width,
                height: 70,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(249, 128, 174, 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.transparent
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.transparent
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.info,color: Colors.white,),
                                    SizedBox(width: 5,),
                                    Text("Info",style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                selector(text: 'info');
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: getColorCont(text: 'info')
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.info,color: getColorContText(text: 'info'),),
                                      SizedBox(width: 5,),
                                      Text("Info",style: GoogleFonts.poppins(color: getColorContText(text: 'info'),fontSize: 14,fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.transparent
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.transparent
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.star_border,color: Colors.white,),
                                    SizedBox(width: 5,),
                                    Text("Reviews",style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                selector(text: 'rev');
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: getColorCont(text: 'rev')
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.star_border,color: getColorContText(text: 'rev'),),
                                      SizedBox(width: 5,),
                                      Text("Reviews",style: GoogleFonts.poppins(color: getColorContText(text: 'rev'),fontSize: 14,fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.transparent
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.transparent
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.location_on,color: Colors.white,),
                                    SizedBox(width: 5,),
                                    Text("Location",style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                selector(text: 'location');
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: getColorCont(text: 'location')
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.location_on,color: getColorContText(text: 'location'),),
                                      SizedBox(width: 5,),
                                      Text("Location",style: GoogleFonts.poppins(color: getColorContText(text: 'location'),fontSize: 14,fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget headers({image,title,price}) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.only(right: 40),
      width: 150,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            top:8,
            left: 8,
            child: Container(
              alignment: Alignment.center,
              width: 150,
              height: 155,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15)
              ),
            ),
          ),
          Positioned(
            top:0,
            child: Container(
              width: 170,
              height: 185,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 10,right: 8,left: 8,bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      child: Image(
                        image: AssetImage(image),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(title,style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500,color: Color.fromRGBO(51,51,127,1)),),
                    Text(price,style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600,color: Color.fromRGBO(249, 128, 174, 1)),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  void selector({text}) {
    setState(() {
      selectedText=text;
    });
  }


  Color getColorCont({text}) {
    if(text==selectedText) {
      return Colors.white;
    }
    else {
      return Colors.transparent;
    }
  }

  Color getColorContText({text}) {
    if(text==selectedText) {
      return Color.fromRGBO(51,51,127,1).withOpacity(1);
    }
    else {
      return Colors.white;
    }
  }


}
