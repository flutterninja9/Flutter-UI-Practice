import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MaterialApp(
  title: "Learning Animation P2",
  home: MyHomePage(),
  debugShowCheckedModeBanner: false,
));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MainAnimtionPage()
            ));
          },
          color: Colors.orange,
          child: Text('BEGIN',style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}

class MainAnimtionPage extends StatefulWidget {
  @override
  _MainAnimtionPageState createState() => _MainAnimtionPageState();
}

class _MainAnimtionPageState extends State<MainAnimtionPage> with SingleTickerProviderStateMixin{
  Animation animation,delayedAnimation,muchDelayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController=AnimationController(duration: Duration(seconds: 2),vsync: this);
    animation=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn
    ));
    delayedAnimation=Tween(begin: 1.0,end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5,1.0,curve: Curves.fastOutSlowIn)
    ));
    muchDelayedAnimation=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8,1.0,curve: Curves.fastOutSlowIn)
    ));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context,child) {
        final double width=MediaQuery.of(context).size.width;
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 8,right: 8,top: 20,bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform(
                    transform: Matrix4.translationValues(animation.value*width,0.0,0.0),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Transform(
                    transform: Matrix4.translationValues(delayedAnimation.value*width,0.0,0.0),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Transform(
                    transform: Matrix4.translationValues(muchDelayedAnimation.value*width,0.0,0.0),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

