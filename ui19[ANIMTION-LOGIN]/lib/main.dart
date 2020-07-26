import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MaterialApp(
  title: 'Animations',
  home: IntroPage(),
  debugShowCheckedModeBanner: false,
));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with SingleTickerProviderStateMixin{
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
    delayedAnimation=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
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
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (context,child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform(
                    transform: Matrix4.translationValues(animation.value*width, 0.0, 0.0),
                    child: Text("LOGIN",style: TextStyle(color: Colors.blueGrey,fontSize: 18,fontWeight: FontWeight.bold),)),
                  SizedBox(height: 8,),
                  Transform(
                    transform: Matrix4.translationValues(delayedAnimation.value*width, 0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hoverColor: Colors.black,
                                hintStyle: TextStyle(color: Colors.grey),
                                hintText: "Username"
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hoverColor: Colors.black,
                                hintStyle: TextStyle(color: Colors.grey),
                                hintText: "Password"
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Transform(
                    transform: Matrix4.translationValues(muchDelayedAnimation.value*width, 0.0, 0.0),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      child: Text("SUBMIT",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Transform(transform: Matrix4.translationValues(muchDelayedAnimation.value*width, 0.0, 0.0),child: Text("Not Registered Yet?",style: TextStyle(color: Colors.blueGrey,fontSize: 15,fontWeight: FontWeight.w400),)),
                  SizedBox(
                    height: 8,
                  ),
                  Transform(
                    transform: Matrix4.translationValues(muchDelayedAnimation.value*width, 0.0, 0.0),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.blueGrey,
                      child: Text("SIGN-UP",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              )
            ),
          )
        );
      },
    );
  }
}


class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MyHomePage()
            ));
          },
          child: Text("LOGIN",style: TextStyle(color: Colors.white),),
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}

