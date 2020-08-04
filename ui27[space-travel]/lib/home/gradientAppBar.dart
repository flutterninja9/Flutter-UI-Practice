import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientAppBar extends StatelessWidget {
  String title;
  GradientAppBar({this.title});
  double barHeight=66.0;
  @override
  Widget build(BuildContext context) {
    double statusBarHeight=MediaQuery.of(context).padding.top;
    return Container(
      height: barHeight+statusBarHeight,
      padding: EdgeInsets.only(top: statusBarHeight),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:9.0),
            child: Icon(Icons.menu,color: Colors.white,size: 30,),
          ),
          Text(title,
          style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 36),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(Icons.search,color: Colors.white,size: 30,),
          ),
        ],
      ),
    );
  }
}
