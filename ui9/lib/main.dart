import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ui9/profile.dart';

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
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            elevation: 0,
            title: Text("EXPLORE",style: GoogleFonts.montserrat(fontSize: 15,color: Colors.black),),
            centerTitle: true,
            leading: IconButton(
              onPressed: null,
              icon: SvgPicture.asset('assets/menu.svg'),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: null,
                icon: SvgPicture.asset('assets/search.svg'),
              ),
            ],
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                margin: EdgeInsets.only(top: 80),
                height: 135,
                width: double.infinity,
                child: ListView(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Center(
                            child: Icon(Icons.add,color: Colors.white,size: 30,),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("Add To",style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w600),),
                      ],
                    ),
                    status('Chris', 'assets/chris.jpg', true),
                    status('Hugh', 'assets/hugh.jpg', false),
                    status('Jhonny', 'assets/johnnydepp.jpg', false),
                    status('Tom', 'assets/tomcruise.jpg', true),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: MediaQuery.of(context).size.height-80,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 2,
                  primary: false,
                  childAspectRatio: 0.37,
                  children: <Widget>[
                    body(image: 'assets/cactus.jpeg',title: 'Random Title Las Vegas Is very Good.',writer: 'Johnny',writerImage: 'assets/johnnydepp.jpg',cardNo: 0),
                    body(image: 'assets/cone.jpeg',title: 'Random Title Random Title Las Vegas Is very Good.',writer: 'Chris',writerImage: 'assets/chris.jpg',cardNo: 1),
                    body(image: 'assets/letter.jpeg',title: 'Random Title Random Title Las Vegas Is very Good.',writer: 'Hugh',writerImage: 'assets/hugh.jpg',cardNo: 2),
                    body(image: 'assets/window.jpeg',title: 'Random Title Random Title Las Vegas Is very Good.',writer: 'Chris',writerImage: 'assets/chris.jpg',cardNo: 3),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget status(name,image,isNew) {
    return Hero(
      tag: image,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Profile(image: image,writer: name,),
          ));
        },
        child: Container(
          margin: EdgeInsets.only(left: 20),
          child: Column(
            children: <Widget>[
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(35),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  SizedBox(width: 20,),
                  Text(name,style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w600),),
                  SizedBox(width: 3,),
                  Container(
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                      color: isNew==true?Colors.orange:Colors.transparent,
                      borderRadius: BorderRadius.circular(3.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget body({image,title,writer,writerImage,int cardNo}) {
    return Container(
      height: 80,
      width: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: cardNo.isEven?MediaQuery.of(context).size.height-450:MediaQuery.of(context).size.height-520,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
            child: Text(title,style: GoogleFonts.montserrat(fontSize: 15),),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            margin: EdgeInsets.only(left: 8,top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(writerImage),
                  radius: 25,
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(writer,style: GoogleFonts.montserrat(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.orange),),
                    SizedBox(height: 5,),
                    Text('09:14PM',style: GoogleFonts.montserrat(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.grey),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

