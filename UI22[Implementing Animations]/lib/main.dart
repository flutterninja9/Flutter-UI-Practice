import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

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
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  Animation titleAnimation,titleAnimationB,bodyAnimation,bodyAnimationMove;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController=AnimationController(duration: Duration(seconds: 1),vsync: this);
    titleAnimation=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn
    ));
    titleAnimationB=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.3,1,curve: Curves.fastOutSlowIn)
    ));
    bodyAnimation=Tween(begin: 0.0,end: 0.9).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.3,1,curve: Curves.easeIn)
    ));
    bodyAnimationMove=Tween(begin: 0.0,end: -0.03).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.4,1,curve: Curves.easeIn)
    ));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    var height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (context,child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 50,left: 15,right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform(
                    transform: Matrix4.translationValues(titleAnimation.value*width, 0.0,0.0),
                    child: Row(
                      children: [
                        Text("Hello",style: GoogleFonts.montserrat(fontSize: 60,fontWeight: FontWeight.w500),),
                        Text(".",style: GoogleFonts.montserrat(fontSize: 50,fontWeight: FontWeight.w500,color: Colors.green),),
                      ],
                    ),
                  ),
                  Transform(
                      transform: Matrix4.translationValues(titleAnimationB.value*width, 0.0,0.0),
                      child: Text("Welcome Back",style: GoogleFonts.montserrat(fontSize: 35,fontWeight: FontWeight.w500),)),
                  SizedBox(height: MediaQuery.of(context).size.height-690,),
                  Transform(
                    transform: Matrix4.translationValues(0.0,bodyAnimationMove.value*width, 0.0),
                    child: FadeTransition(
                      opacity: bodyAnimation,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: GoogleFonts.poppins()
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Transform(
                    transform: Matrix4.translationValues(0.0,bodyAnimationMove.value*width, 0.0),
                    child: FadeTransition(
                      opacity: bodyAnimation,
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: GoogleFonts.poppins(),
                            suffixIcon: Icon(Icons.remove_red_eye,color: Colors.blueGrey,)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform(
                        transform: Matrix4.translationValues(0.0,bodyAnimationMove.value*width, 0.0),
                        child: FadeTransition(
                           opacity: bodyAnimation,
                            child: Text("Forgot your password?",style: GoogleFonts.poppins(color: Colors.blueGrey),)),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height-530,),
                  Transform(
                    transform: Matrix4.translationValues(titleAnimation.value*width, 0.0,0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text("LOGIN",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeTransition(
                        opacity: bodyAnimation,
                        child: Row(
                          children: [
                            Text("Skip for now",style: GoogleFonts.montserrat(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w300),),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      ),
                    ],
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
