import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:ui8/model/instructor.dart';

class InstructorDetails extends StatefulWidget {
  final Instructor selectedInstructor;
  InstructorDetails({this.selectedInstructor});
  @override
  _InstructorDetailsState createState() => _InstructorDetailsState();
}

class _InstructorDetailsState extends State<InstructorDetails> {
  double ratingVal=3.5;
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
           Container(
             height: height,
             width: width,
             color: Colors.transparent,
           ),
          Container(
            height: height-height/3,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/surfing.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: height-height/3-65,
            child: Container(
              height: height/3+65,
              width: width,
              padding: EdgeInsets.only(left: 20,right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 25,),
                  Text(widget.selectedInstructor.instructorName,style: GoogleFonts.poppins(fontSize: 27,color: Colors.black,fontWeight: FontWeight.w500),),
                  Text('Santa Monica, CA',style: GoogleFonts.poppins(fontSize: 15,color: Colors.grey[700]),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SmoothStarRating(
                        rating: 4.5,
                        color: Colors.deepOrangeAccent,
                        borderColor: Colors.grey,
                        onRated: (v) {
                          setState(() {
                            ratingVal=v;
                          });
                        },
                      ),
                      SizedBox(width: 8,),
                      Text(ratingVal.toString(),style: GoogleFonts.montserrat(fontSize: 15,color: Colors.deepOrangeAccent),),
                      SizedBox(width: 15,),
                      Text("(200 Reviews)",style: GoogleFonts.montserrat(fontSize: 15,color: Colors.grey[500],letterSpacing: 0.5),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Extremity direction existence as dashwoods do up. Securing marianne led welcomed offended but offering six raptures.",style: GoogleFonts.montserrat(color: Colors.black,height: 1.5,),),
                 SizedBox(height: 5,),
                  Text("READ MORE",style: GoogleFonts.montserrat(color: Colors.deepOrangeAccent,height: 1.5,),),
                SizedBox(height: 10,),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(left: 15),
              width: width/2,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('200',style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.bold),),
                      Text('Reviews',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey[600]),),
                    ],
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('4',style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.bold),),
                      Text('Programs',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey[600]),),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 80,
              width: width/2-35,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 110, 29, 1),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.arrow_forward_ios,color: Colors.white,),
                  SizedBox(height: 5,),
                  Text("Availibility",style: GoogleFonts.poppins(fontSize: 17,color: Colors.white,letterSpacing: 0.5),),
                ],
              ),
            ),
          ),
          Positioned(
            top: height-height/3-100,
            left: width-135,
            child: Hero(
              tag: widget.selectedInstructor.instructorPic,
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.selectedInstructor.instructorPic),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back,color: Colors.white,),
            ),
          ),
          Positioned(
            top: 25,
            left: width-50,
            child: IconButton(
              onPressed: () {
              },
              icon: Icon(Icons.favorite,color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }
}
