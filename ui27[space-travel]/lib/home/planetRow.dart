import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui27/home/plantDetails.dart';
import 'package:ui27/model/planetDetail.dart';
import 'package:ui27/model/planetsDetails.dart';

class PlanetRow extends StatelessWidget {

  final Planet planet;
  PlanetRow({this.planet});



  @override
  Widget build(BuildContext context) {


    final baseTextStyle =  GoogleFonts.poppins();
    final headerTextStyle = baseTextStyle.copyWith(
        color:  Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w600
    );
    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400
    );
    final subHeaderTextStyle = regularTextStyle.copyWith(
        fontSize: 12.0
    );

    final planetThumbnail=Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      alignment: FractionalOffset.centerLeft,
      child: Hero(
        tag: planet.name,
        child: Image(
          height: 92,
          width: 92,
          image: AssetImage(planet.image),
        ),
      ),
    );


    Widget _planetValue({String value, String image}) {
      return new Row(
          children: <Widget>[
            new Image.asset(image, height: 12.0),
            new Container(width: 8.0),
            new Text(planet.gravity, style: regularTextStyle),
          ]
      );
    }

    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(planet.name,
            style: headerTextStyle,
          ),
          new Container(height: 10.0),
          new Text(planet.location,
              style: subHeaderTextStyle

          ),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                  child: _planetValue(
                      value: planet.distance,
                      image: 'assets/ic_distance.png')

              ),
              new Expanded(
                  child: _planetValue(
                      value: planet.gravity,
                      image: 'assets/ic_gravity.png')
              )
            ],
          )
        ],
      ),
    );

    final planetCard=Container(
      child: planetCardContent,
      height: 124,
      margin: EdgeInsets.only(left: 46),
      decoration: BoxDecoration(
          color: new Color(0xFF333366),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0.0,10.0),
            )
          ]
      ),
    );


    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PlanetDetails(planet: planet,)
        ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16,horizontal: 24),
        child: Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ),
      ),
    );
  }

}
