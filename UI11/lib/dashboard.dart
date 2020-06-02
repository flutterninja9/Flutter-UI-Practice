import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui11/placeDetail.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Color.fromRGBO(27, 27, 27, 1),
        body: SingleChildScrollView(
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
                        child: Icon(Icons.filter_list,color: Colors.white,),
                      ),
                    ),
                    Text(
                      "HOME",
                      style: GoogleFonts.poppins(fontSize: 20,color: Colors.white),
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
              SizedBox(height: 20,),
              Container(
                //alignment: Alignment(-0.4,-1),
                height: MediaQuery.of(context).size.height-50,
                width: 380,
                child: ListView(
                  primary: false,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: <Widget>[
                       AreaCard(image: 'assets/japan.jpg',name: 'JAPAN',description: 'Explore the land of the rising sun.'),
                       AreaCard(image: 'assets/canada.jpg',name: 'CANADA',description: 'Explore the vast forests of canada.'),
                       AreaCard(image: 'assets/tokyo.jpg',name: 'TOKYO',description: 'Feel the drift of tokyo.'),
                  SizedBox(height: 100,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget AreaCard({image,name,description}) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 360,
      width: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(name,style: GoogleFonts.montserrat(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
          Text(description,style: GoogleFonts.montserrat(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w400),),
          SizedBox(height: 30),
          Container(
            height: 70,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PlaceDetails(name: name,image: image,description: description,),
                ));
              },
              child: Text("Explore Now",style: GoogleFonts.montserrat(fontSize: 18,color: Color.fromRGBO(239, 71, 147, 1),fontWeight: FontWeight.w500),),
            ),
          ),
        ],
      ),
    );
  }

}
