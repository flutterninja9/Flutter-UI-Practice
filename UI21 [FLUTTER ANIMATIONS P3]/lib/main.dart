import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MaterialApp(
  title: "Flutter Animations P3",
  home: HomePage(),
  debugShowCheckedModeBanner: false,
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parenting Animations'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              color: Colors.red,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AnimationArea()
                ));
              },
              child: Text("Parenting Animation",style: TextStyle(color: Colors.white),),
            ),
            FlatButton(
              color: Colors.purple,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimationArea2()
                ));
              },
              child: Text("Transform Animation",style: TextStyle(color: Colors.white),),
            ),
            FlatButton(
              color: Colors.blueGrey,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimationArea3()
                ));
              },
              child: Text("IntTween Animation",style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimationArea extends StatefulWidget {
  @override
  _AnimationAreaState createState() => _AnimationAreaState();
}

class _AnimationAreaState extends State<AnimationArea>  with SingleTickerProviderStateMixin{
  Animation animation,parentAnimation;
  AnimationController animationController;


  @override
  void initState() {
    super.initState();
    animationController=AnimationController(duration: Duration(milliseconds: 1000),vsync: this);
    animation=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut
    ));
    parentAnimation=Tween(begin: 20.0,end: 125.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn
    ));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (context,child) {
        return Scaffold(
          body: Center(
            child: Transform(
              transform: Matrix4.translationValues(animation.value*width, 0,0),
              child: Container(
                height: parentAnimation.value*2,
                width: parentAnimation.value*2,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


class AnimationArea2 extends StatefulWidget {
  @override
  _AnimationArea2State createState() => _AnimationArea2State();
}

class _AnimationArea2State extends State<AnimationArea2> with SingleTickerProviderStateMixin{
  Animation animation,mainAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController=AnimationController(duration: Duration(seconds: 1),vsync: this);
    mainAnimation=Tween(begin: 10.0,end: 200.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn
    ));
    animation=BorderRadiusTween(begin: BorderRadius.circular(200),end:BorderRadius.circular(8)).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut
    ));
    animationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (context,child) {
        return Scaffold(
          body: Center(
            child: Container(
              height: mainAnimation.value,
              width: mainAnimation.value,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: animation.value
              ),
            )
          ),
        );
      },
      
    );
  }
}

class AnimationArea3 extends StatefulWidget {
  @override
  _AnimationArea3State createState() => _AnimationArea3State();
}

class _AnimationArea3State extends State<AnimationArea3>  with SingleTickerProviderStateMixin{

  AnimationController animationController;
  Animation animation;


  @override
  void initState() {
    super.initState();
    animationController=AnimationController(duration: Duration(seconds: 5),vsync: this);
    animation=IntTween(begin: 0,end: 10).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut
    ));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context,child) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Changing Values",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w500),),
                Text(animation.value.toString(),style: TextStyle(fontSize: 60,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        );
      },
    );
  }
}



