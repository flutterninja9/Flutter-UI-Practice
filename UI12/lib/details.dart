import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class Details extends StatefulWidget {
  String image,price,name;
  Details({this.image,this.name,this.price});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int itemCount=2;
  bool itemClicked=false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Color.fromRGBO(126, 160, 248, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(126, 160, 248, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Details",style: GoogleFonts.montserrat(),),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_horiz),
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height-83,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                 Positioned(
                   top: 150,
                   child: Container(
                     height: MediaQuery.of(context).size.height-233,
                     width: MediaQuery.of(context).size.width,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                       color: Colors.white,
                     ),
                   ),
                 ),
                  Positioned(
                    top: 90,
                    left: MediaQuery.of(context).size.width/5,
                    child: Hero(
                      tag: widget.image,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.image),

                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 320,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(margin:EdgeInsets.only(left:20),child: Text(widget.name,style: GoogleFonts.montserrat(fontSize: 30,fontWeight: FontWeight.w500),)),
                        SizedBox(height: 15,),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text("\$"+widget.price,style: GoogleFonts.montserrat(fontSize: 25,color: Colors.grey[600]),),
                              SizedBox(width: 50,),
                              Container(
                                width: 2,
                                height: 50,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 50,),
                              Container(
                                width: 130,
                                height: 50,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(126, 160, 248, 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    InkWell(onTap: () {
                                      setState(() {
                                        itemCount-=1;
                                      });
                                    },child: Icon(Icons.remove,color: Colors.white,)),
                                    //SizedBox(width: 1,),
                                    AnimatedContainer(duration:Duration(milliseconds: 500),curve: Curves.easeIn,child: Text(itemCount.toString(),style: GoogleFonts.montserrat(fontSize: 25,color: Colors.white),)),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: InkWell(onTap: () {
                                          setState(() {
                                            itemCount+=1;
                                          });
                                        },child: Icon(Icons.add,color: Color.fromRGBO(126, 160, 248, 1),)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(
                          height: 180,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                                 macros(macro: "WEIGHT",desc: "G",detail: "300"),
                                 macros(macro: "CALORIES",desc: "CAL",detail: "267"),
                                 macros(macro: "VITAMIN",desc: "VIT",detail: "A,B6"),
                                 macros(macro: "MINERALS",desc: "MIN",detail: "XE,XYZ"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(left: 10,right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                              color: Color.fromRGBO(22,11, 36,1),
                            ),
                            child: Center(
                              child:Text("Continue Payment",style: GoogleFonts.montserrat(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w300),),
                            ),
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
    );
  }

  Widget macros({macro,detail,desc}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      margin: EdgeInsets.all(10),
      height: 170,
      width: 120,
      decoration: BoxDecoration(
        color: Color.fromRGBO(126, 160, 248, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(macro,style: GoogleFonts.montserrat(color: Colors.white,fontSize: 18),),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Text(detail,style: GoogleFonts.montserrat(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),),
              ),Padding(
                padding: const EdgeInsets.only(left:8.0,bottom: 10),
                child: Text(desc,style: GoogleFonts.montserrat(color: Colors.white,fontSize: 20),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
