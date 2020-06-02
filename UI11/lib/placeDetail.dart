import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceDetails extends StatefulWidget {
  String image,name,description;
  PlaceDetails({this.image,this.description,this.name});
  @override
  _PlaceDetailsState createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  int selectedItem=0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return SafeArea(
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height-80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken)
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 4,sigmaX: 4),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(239, 71, 147, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                            ),
                          ),
                        ),
                        Text(
                          widget.name,
                          style: GoogleFonts.poppins(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w400),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(Icons.bookmark_border,color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Trending Attractions",style: GoogleFonts.montserrat(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.white),),
                            Icon(Icons.more_vert,color: Colors.white,),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(widget.image),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text("Random Tour Place",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                                  Text("2 Days and 3 Nights",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),),
                                ],
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Icon(Icons.navigate_next,color: Color.fromRGBO(239, 71, 147, 1),size: 35,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Trending Attractions",style: GoogleFonts.montserrat(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.white),),
                      ),
                      Container(
                        height: 180,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                           MainPlaces(image: 'https://images.unsplash.com/photo-1500835556837-99ac94a94552?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',place: 'Mount Hozu'),
                           MainPlaces(image: 'https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',place: 'Poll Beach'),
                           MainPlaces(image: 'https://images.unsplash.com/photo-1503220317375-aaad61436b1b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',place: 'Amazon'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget MainPlaces({image,place}) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: 150,
      width:150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Icon(Icons.bookmark_border,color: Color.fromRGBO(239, 71, 147, 1),size: 25,),
                ),
              ],
            ),
          ),
          SizedBox(height: 80,),
          Container(margin: EdgeInsets.only(left: 5),child: Text(place,style: GoogleFonts.poppins(color: Colors.white,fontSize: 18),)),
          Container(margin: EdgeInsets.only(left: 5),child: Text("\$200-500",style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),)),
        ],
      ),
    );
  }
}
