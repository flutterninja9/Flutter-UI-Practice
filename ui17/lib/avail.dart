import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';


class Avail extends StatefulWidget {
  @override
  _AvailState createState() => _AvailState();
}

class _AvailState extends State<Avail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251,193,44,1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(251,193,44,1),
        leading: Container(),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back,color: Colors.black,),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child:  Container(
          color: Colors.white,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("REGISTER",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w600),),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Check Vehicle",style: GoogleFonts.montserrat(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),
                Text("Availability",style: GoogleFonts.montserrat(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.arrow_forward,color: Colors.white,),
                    Text("Enter Your Zip Code",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 17),),
                  ],
                ),
                SizedBox(height: 3,),
                Text("  We want to ensure that this vehicle",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 13),),
                Text("  is available for delivery.",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 13),),
                SizedBox(height: 20,),
                Image.asset('assets/porsche.png'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
