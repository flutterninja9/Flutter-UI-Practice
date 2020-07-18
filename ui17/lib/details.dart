import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("PORSCHE",style: GoogleFonts.oswald(fontSize: 35,fontWeight: FontWeight.w500),),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back,color: Colors.black,),
                    ),
                  ],
                ),
                Text("2019 -911 CARRERA S",style: GoogleFonts.oswald(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.grey),),
                SizedBox(height: 20,),
                Text("Sharpen Your Edge",style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.grey[600]),),
                Text("The new 911 is the sum of all its predecessors - and its therefore a reflection of past and vision of future.",style: GoogleFonts.montserrat(fontSize: 17,fontWeight: FontWeight.w400),),
                Hero(tag: "car",child: Image.asset('assets/porsche.png')),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 100,
                        width: 100,
                        child: Image.network('https://image.shutterstock.com/image-photo/supercar-interior-view-through-sunroof-600w-1048624043.jpg'),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 100,
                        width: 100,
                        child: Image.network('https://image.shutterstock.com/image-photo/frankfurtseptember-20-interior-porsche-911-260nw-729806200.jpg'),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 100,
                        width: 100,
                        child: Image.network('https://image.shutterstock.com/image-photo/paramus-nj-42117-close-driver-260nw-688360423.jpg'),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 100,
                        width: 100,
                        child: Image.network('https://image.shutterstock.com/image-photo/geneva-mar-4-porsche-911-260nw-181161647.jpg'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 40,width:40,child: Image.asset('assets/fuel.png')),
                            Text("MPG",style: GoogleFonts.oswald(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey),),
                          ],
                        ),
                        Text("19/24",style: GoogleFonts.oswald(fontSize: 35,fontWeight: FontWeight.w500),),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 40,width:40,child: Image.asset('assets/speed.png')),
                            Text("0-60",style: GoogleFonts.oswald(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey),),
                          ],
                        ),
                        Text("3.4",style: GoogleFonts.oswald(fontSize: 35,fontWeight: FontWeight.w500),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 40,width:40,child: Image.asset('assets/hp.png')),
                              Text("HP",style: GoogleFonts.oswald(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey),),
                            ],
                          ),
                          Text("443",style: GoogleFonts.oswald(fontSize: 35,fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Center(child: Text("DRIVE THIS CAR",style: GoogleFonts.oswald(fontSize: 20,fontWeight: FontWeight.w500),)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
