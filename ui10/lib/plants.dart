import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantDetails extends StatefulWidget {
  @override
  _PlantDetailsState createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {
  ScrollController _scrollController;

  List<String> allDescriptions = [ 'Aloe vera is a succelent plant of the genus Aloe. I\'ts medicinal uses and air purifying ability make it the plant that you shouldn\'t live without.',
    'Some other description',
    'Third description','Fourth Description','Fifth Description'];

  String description;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(changedesc);
    setState(() {
      description = allDescriptions[0];
    });
  }

  changedesc() {
    var value = _scrollController.offset.round();
    var descIndex = (value / 300).round();
    print(value);
    setState(() {
      description = allDescriptions[descIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            height: 370,
            child: ListView(
              padding: EdgeInsets.only(left: 25),
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              children: <Widget>[
                 getPlant(price: "\$50",type: "OUTDOOR",name: "Aloe Vera",image: "assets/aloevera.png"),
                 getPlant(price: "\$35",type: "INDOOR",name: "White Plant",image: "assets/whiteplant.png"),
                 getPlant(price: "\$65",type: "INDOOR",name: "Ficus",image: "assets/ficus.png"),
                 getPlant(price: "\$45",type: "OUTDOOR",name: "Flower Plant",image: "assets/flowerplant.png"),
                 getPlant(price: "\$15",type: "OUTDOOR",name: "Small Plant",image: "assets/smallplant.png"),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15,top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Description",style: GoogleFonts.montserrat(fontSize: 20,color: Colors.black),),
                SizedBox(height: 10,),
                Text(description,style: GoogleFonts.montserrat(fontSize: 15,color: Colors.grey),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getPlant({price,image,name,type}) {

    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 25),
          height: 400,
          width: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(50, 160, 96, 1),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            height: 350,
            width: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("FROM",style: GoogleFonts.montserrat(fontSize: 16,color: Colors.white.withOpacity(0.7)),),
                        Text(price,style: GoogleFonts.montserrat(fontSize: 25,color: Colors.white),),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(type,style: GoogleFonts.montserrat(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white.withOpacity(0.7,)),),
                    Text(name,style: GoogleFonts.montserrat(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white),),
                   SizedBox(height: 6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 40,
                          padding: EdgeInsets.all(5),
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          child: SvgPicture.asset('assets/sun.svg',color: Colors.white,),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 40,
                          padding: EdgeInsets.all(5),
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          child: SvgPicture.asset('assets/droplet.svg',color: Colors.white,),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 40,
                          padding: EdgeInsets.all(5),
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          child: SvgPicture.asset('assets/temp.svg',color: Colors.white,),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 20,
          child: SizedBox(
            height: 250,
            width: 240,
            child: Container(
              child: Image.asset(image),
            ),
          ),
        ),
        Positioned(
          top: 305,
          left: 190,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Icon(Icons.shopping_cart,color: Colors.white,),
            ),
          ),
        ),
      ],
    );

  }

}
