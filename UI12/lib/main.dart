import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:ui12/details.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Color.fromRGBO(11, 194, 191, 1),));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(11, 194, 191, 1),
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios,),
        actions: <Widget>[
          Icon(Icons.filter_list,size: 30,),
          SizedBox(width: 15,),
          SvgPicture.asset('assets/award.svg',color: Colors.white,height: 25,),
          SizedBox(width: 15,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-100,
              color: Color.fromRGBO(11, 194, 191, 1),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 30,
                    left: 20,
                    child: RichText(
                      text: TextSpan(
                        text: "Healthy",
                        style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 30),
                        children: [
                          TextSpan(
                            text: " Food",
                            style: GoogleFonts.montserrat(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    child: Container(
                      height: MediaQuery.of(context).size.height-100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        children: <Widget>[
                           itemMenu(name: "Salmon Bowl",price: "24.00",image: 'assets/plate1.png'),
                           itemMenu(name: "Spring Bowl",price: "44.40",image: 'assets/plate2.png'),
                           itemMenu(name: "Avocado Bowl",price: "64.30",image: 'assets/plate3.png'),
                           itemMenu(name: "Premium Bowl",price: "24.00",image: 'assets/plate4.png'),
                           itemMenu(name: "Winter Bowl",price: "14.30",image: 'assets/plate5.png'),
                           itemMenu(name: "Autumn Bowl",price: "43.00",image: 'assets/plate6.png'),
                           SizedBox(height: 30,),
                          SizedBox(
                            height: 150,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 590,
                    left: MediaQuery.of(context).size.width/6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.grey,
                              )
                          ),
                          child: Center(
                            child: Icon(Icons.search),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20,right: 20),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.grey,
                              )
                          ),
                          child: Center(
                            child: Icon(Icons.card_travel),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(22,11, 36,1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Checkout",
                              style: GoogleFonts.montserrat(color: Colors.white,fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemMenu({name,price,image}) {
    return Container(
      margin: EdgeInsets.only(top: 20,left: 20,right: 20),
      width: MediaQuery.of(context).size.width-40,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Material(child:Details(image: image,name: name,price: price,)),
                ),
              );
            },
            child: Hero(
              tag: image,
              child: Container(
                height: 130,
                width: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(name,style: GoogleFonts.montserrat(fontSize: 18,fontWeight: FontWeight.w500),),
                  Text("\$"+price.toString(),style: GoogleFonts.montserrat(fontSize: 15,color: Colors.grey[600]),),
                ],
              ),
              SizedBox(width: 2,),
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color:Color.fromRGBO(11, 194, 191, 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(child: Icon(Icons.add,size: 20,))
              ),
            ],
          ),
        ],
      ),
    );
  }

}


