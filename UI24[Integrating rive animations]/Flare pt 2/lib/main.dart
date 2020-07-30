import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';

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
  bool isOn=false;
  FlareController controller;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(margin: EdgeInsets.only(top: 100),height: 400,child: FlareActor('assets/anim.flr',controller:controller,animation: isOn?'coding':'activate',fit: BoxFit.contain,)),
         Padding(
           padding: const EdgeInsets.only(bottom: 15),
           child: FloatingActionButton(
             onPressed: () {
               setState(() {
                 isOn=!isOn;
               });
             },
             backgroundColor: Colors.black,
             child: Icon(Icons.play_arrow),
           ),
         ),
        ],
      )
    );
  }
}
