import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:ui17/avail.dart';
import 'package:ui17/details.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Avail()
              )
            );
          },
          icon: Icon(Icons.camera_alt,color: Colors.amber,size: 30,),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your Current",style: GoogleFonts.montserrat(fontSize: 40,fontWeight: FontWeight.bold,color: Color.fromRGBO(65,74,105,1)),),
                Text("Vehicle",style: GoogleFonts.montserrat(fontSize: 40,fontWeight: FontWeight.bold,color: Color.fromRGBO(65,74,105,1)),),
                InkWell(onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Details()
                  ));
                },child: Hero(tag: "car",child: Image.asset('assets/porsche.png'))),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("PORSCHE",style: GoogleFonts.oswald(fontSize: 35,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("2019 -911 CARRERA S",style: GoogleFonts.oswald(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.grey),),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Divider(
                    color: Colors.grey,
                  ),
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
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.refresh,color: Colors.grey,size: 30,),
                        SizedBox(width: 2,),
                        Text("EXCHANGE YOUR VEHICLE",style: GoogleFonts.oswald(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey),),
                      ],
                    ),
                    Icon(Icons.arrow_forward,size: 30,color: Colors.grey,),
                  ],
                ),
                SizedBox(height: 40,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
