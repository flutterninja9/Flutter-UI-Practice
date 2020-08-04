import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui27/model/planetDetail.dart';

class PlanetDetails extends StatefulWidget {
  Planet planet;
  PlanetDetails({this.planet});
  @override
  _PlanetDetailsState createState() => _PlanetDetailsState();
}

class _PlanetDetailsState extends State<PlanetDetails> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight=MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: new Color(0xFF736AB7),
      body: Column(
        children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                padding: EdgeInsets.only(top: statusBarHeight,left: 10,right: 10),
                height: 300+statusBarHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.planet.backImage),
                    fit: BoxFit.cover
                  )
                ),

                child: Container(
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: ()
                            {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.arrow_back,color: Colors.white,),
                          ),
                          IconButton(
                            onPressed: ()
                            {

                            },
                            icon: Icon(Icons.more_vert,color: Colors.white,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 110,
                margin: EdgeInsets.only(top: 220),
                decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0x00736AB7),
                    Color(0xFF736AB7)
                  ],
                  stops: [0.0,0.9],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.0, 1.0),
                )
                ),
              ),

              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 220,left: 20,right: 20),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(67,66,115,1),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(3,15),
                    ),
                  ]
                ),
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.planet.name,style: GoogleFonts.poppins(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                    Text(widget.planet.location,style: GoogleFonts.poppins(fontSize: 16,color: Colors.grey[400]),),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 4,
                      width: 30,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/ic_distance.png')
                                )
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(widget.planet.distance,style: GoogleFonts.poppins(color: Colors.grey[400]),),
                          ],
                        ),
                        SizedBox(width: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/ic_gravity.png')
                                  )
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(widget.planet.gravity,style: GoogleFonts.poppins(color: Colors.grey[400]),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ),
              Positioned(
                top: 160,
                left: MediaQuery.of(context).size.width/2.9,
                child: Hero(
                  tag: widget.planet.name,
                  child: Container(
                    alignment: Alignment.center,
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.planet.image)
                        )
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 430,
                child: Container(
                  height: 300,
                  padding: EdgeInsets.only(left: 15,bottom: 5),
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      Text("OVERVIEW",style: GoogleFonts.montserrat(fontSize: 19,color: Colors.white,fontWeight: FontWeight.w500),),
                      Container(
                        margin: EdgeInsets.only(top: 2,right: MediaQuery.of(context).size.width-40),
                        height: 4,
                        width: 30,
                        color: Colors.blue,
                      ),
                      SizedBox(height: 12,),
                      Text(
                          "A planet is an astronomical body orbiting a star or stellar remnant that is massive enough to be rounded by its own gravity, is not massive enough to cause thermonuclear fusion, and has cleared its neighbouring region of planetesimals.\n The planets were thought by Ptolemy to orbit Earth in deferent and epicycle motions."
                      ,style: GoogleFonts.poppins(color: Colors.grey[400]),
                      ),
                      SizedBox(height: 12,),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height-70),
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          const Color(0xFF3366FF),
                          const Color(0xFF00CCFF),
                        ],
                        begin: FractionalOffset(0.0,0.0),
                        end: FractionalOffset(1.0,0.0),
                        stops: [0.0,1.0],
                        tileMode: TileMode.clamp
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("START FROM",style: GoogleFonts.montserrat(fontSize:16,color: Colors.white),),
                          Text("\$2.8m",style: GoogleFonts.montserrat(fontSize:30,color: Colors.white,fontWeight: FontWeight.w500),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("BOOK NOW",style: GoogleFonts.montserrat(fontSize:20,color: Colors.white),),
                          Icon(Icons.arrow_forward_ios,color: Colors.white,),
                        ],
                      ),
                    ],
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
