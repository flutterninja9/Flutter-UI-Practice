import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String btnText="READY?";

  void changeText() {
    Future.delayed(Duration(milliseconds: 3500),() {
      setState(() {
        btnText="START";
      });
    });
  }

  @override
  void initState() {
    super.initState();
    changeText();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ShowUpAnimation(
                      animationDuration: Duration(milliseconds: 500),
                      delayStart: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                      child: Text("Express",style: TextStyle(color: Colors.grey[400],fontSize: 70,),)
                  ),
                  ShowUpAnimation(animationDuration: Duration(milliseconds: 500),
                      delayStart: Duration(milliseconds: 1000),
                      curve: Curves.easeIn,child: Text("YOUR TRUE",style: TextStyle(color: Colors.white,fontSize: 70),)),
                  ShowUpAnimation(animationDuration: Duration(milliseconds: 500),
                      delayStart: Duration(milliseconds: 1500),
                      curve: Curves.easeIn,child: Text("SELF",style: TextStyle(color: Colors.white,fontSize: 70),)),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              color: Colors.grey[700].withOpacity(0.0),
              child: ShowUpAnimation(
                animationDuration: Duration(milliseconds: 500),
                delayStart: Duration(milliseconds: 2000),
                curve: Curves.easeIn,
                direction: Direction.horizontal,
                child: MaterialButton(
                  onPressed: () {},
                  child: Text("BEGIN",style: TextStyle(fontSize: 35,letterSpacing: 0.5,color: Colors.white),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
