import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1482501157762-56897a411e05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
                fit: BoxFit.cover,
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Icon(Icons.shopping_cart,size: 22,),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 180,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,),
                  child: Text("Women",style: GoogleFonts.poppins(color: Colors.white,fontSize: 35),),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Cutting-Edge items to style in style, perfect\nfor all of your moments.",style: GoogleFonts.poppins(fontSize: 15,color: Colors.grey[800]),),
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: 145,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(52),
                    image: DecorationImage(
                      image: NetworkImage('https://images.unsplash.com/photo-1504703395950-b89145a5425b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=651&q=80'),
                    fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken)
                    ),
                  ),
                  child: Center(
                    child: Text("New",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 20),),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage('https://images.unsplash.com/photo-1485230895905-ec40ba36b9bc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
                   fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken)
                    ),
                  ),
                  child: Center(
                    child: Text("Tops",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 20),),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage('https://images.unsplash.com/photo-1572804013427-4d7ca7268217?ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80'),
                    fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken)
                    ),
                  ),
                  child: Center(
                    child: Text("Pants",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 20),),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage('https://images.unsplash.com/photo-1543087903-1ac2ec7aa8c5?ixlib=rb-1.2.1&auto=format&fit=crop&w=1074&q=80'),
                    fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken)
                    ),
                  ),
                  child: Center(
                    child: Text("Home",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 20),),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 550,
            padding: EdgeInsets.only(left: 20,top: 10,right: 20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Trending Wear",style: GoogleFonts.montserrat(fontSize: 20),),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 500,
                  width: 600,
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    childAspectRatio: 0.7,
                    children: <Widget>[
                      menu(image: 'https://images.unsplash.com/photo-1571137804941-5eafd456873b?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',price: "\$250.00"),
                      menu(image: 'https://images.unsplash.com/photo-1550614000-4895a10e1bfd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',price: "\$145.00"),
                      menu(image: 'https://images.unsplash.com/photo-1551803091-e20673f15770?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80',price: "\$766.45"),
                      menu(image: 'https://images.unsplash.com/photo-1548454433-4a1812514573?ixlib=rb-1.2.1&auto=format&fit=crop&w=337&q=80',price: "\$712.00"),
                      menu(image: 'https://images.unsplash.com/photo-1554735109-39c2ab93b0ce?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',price: "\$215.98"),
                      menu(image: 'https://images.unsplash.com/photo-1548105691-63f4815922fb?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',price: "\$215.98"),
                      menu(image: 'https://images.unsplash.com/photo-1563293958-0159cd7dd208?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',price: "\$215.98"),
                      menu(image: 'https://images.unsplash.com/photo-1554787497-98caae0f95df?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',price: "\$115.98"),
                      menu(image: 'https://images.unsplash.com/photo-1571682262898-48532c58b3a1?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',price: "\$245.98"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget menu({image,price}) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:5.0),
            child: Text(price,style: GoogleFonts.montserrat(),),
          ),
        ],
      ),
    );
  }
}
