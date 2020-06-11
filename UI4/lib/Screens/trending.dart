import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Trending() {
  return ListView(
    physics: BouncingScrollPhysics(),
    shrinkWrap: true,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top:8,left: 8),
        child: Text("Trending Music For You",style: GoogleFonts.quicksand(fontSize: 20,fontWeight: FontWeight.w500),),
      ),
      Container(
        height: 180,
        margin: EdgeInsets.only(top: 8),
        width: double.infinity,
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            Trends(image: "https://images.unsplash.com/flagged/photo-1564259817498-4e9b7ee3bd9e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
            Trends(image: "https://images.unsplash.com/photo-1569667895819-01d7f0dd6cea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
            Trends(image: "https://images.unsplash.com/photo-1578390384738-a78c02b914d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top:25,left: 8),
        child: Text("Listen Again",style: GoogleFonts.quicksand(fontSize: 20,fontWeight: FontWeight.w500),),
      ),
      Container(
        height: 180,
        margin: EdgeInsets.only(top: 8),
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Trends(image: "https://images.unsplash.com/photo-1571974599782-87624638275e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
            Trends(image: "https://images.unsplash.com/photo-1565010306786-f6375b362cd4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
            Trends(image: "https://images.unsplash.com/photo-1588066080712-b972871ee36b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top:25,left: 8),
        child: Text("Listen Based On Categories",style: GoogleFonts.quicksand(fontSize: 20,fontWeight: FontWeight.w500),),
      ),
      Container(
        height: 70,
        margin: EdgeInsets.only(top: 8),
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Catergory(text: "LoFi"),
            Catergory(text: "DubStep"),
            Catergory(text: "Chill Beats"),
            Catergory(text: "Party"),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top:25,left: 8),
        child: Text("You Favourites",style: GoogleFonts.quicksand(fontSize: 20,fontWeight: FontWeight.w500),),
      ),
      Container(
        height: 180,
        margin: EdgeInsets.only(top: 8),
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Trends(image: "https://images.unsplash.com/photo-1565682547411-1dd0d564d02b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
            Trends(image: "https://images.unsplash.com/photo-1566561626092-0cc0e2b2b4df?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
            Trends(image: "https://images.unsplash.com/photo-1509585585779-17594514ad43?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
          ],
        ),
      ),
    ],
  );
}

Widget Trends({image}) {
  return Container(
    margin: EdgeInsets.only(left: 10),
    height: 180,
    width: 250,
    decoration: BoxDecoration(
      color: Colors.grey,
      image: DecorationImage(
        image: NetworkImage(image),
        fit: BoxFit.cover,
      ),
    ),
  );
}


Widget Catergory({text}) {
  return Container(
    margin: EdgeInsets.only(left: 10),
    height: 70,
    width: 180,
    decoration: BoxDecoration(
      color: Color.fromRGBO(64, 207, 104, 1),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
      child: Text(text,style: GoogleFonts.poppins(color: Colors.white,fontSize: 25),),
    ),
  );
}

