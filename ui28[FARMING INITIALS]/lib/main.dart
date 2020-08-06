import 'package:flutter/material.dart';
import 'package:ui28/helpers/SysColor.dart';
import 'package:ui28/helpers/strings.dart';
import 'package:google_fonts/google_fonts.dart';

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
  PageController _controller;
  int initialPage=0;

  @override
  void initState() {
    super.initState();
    _controller=PageController(initialPage: initialPage,);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          InkWell(
            onTap: () {
                if(initialPage==2) {
                  setState(() {
                    initialPage=0;
                  });
                }
                else {
                  setState(() {
                  initialPage=initialPage+1;
                  });
              }
              _controller.animateToPage(initialPage, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            },
            child: Padding(
              padding: EdgeInsets.only(top: 20,right: 20),
              child: initialPage==2?Text('Start',
                style: GoogleFonts.poppins(color: ColorSys.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ):Text('Next',
                style: GoogleFonts.poppins(color: ColorSys.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          PageView(
            onPageChanged: (int index) {
              setState(() {
                initialPage=index;
              });
            },
            controller: _controller,
            children: [
              makePage(image: 'assets/images/step-one.png',title: Strings.stepOneTitle,content: Strings.stepOneContent),
              makePage(image: 'assets/images/step-two.png',title: Strings.stepTwoTitle,content: Strings.stepTwoContent),
              makePage(image: 'assets/images/step-three.png',title: Strings.stepThreeTitle,content: Strings.stepThreeContent,reverse: true),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Widget makePage({image,title,content,reverse=false}) {
    return Container(
      padding: EdgeInsets.only(left: 50,right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
              SizedBox(height: 30,),
            ],
          ),
          Text(title,style: GoogleFonts.montserrat(
              color: ColorSys.primary,
              fontSize: 30,
              fontWeight: FontWeight.bold
          )
          ),
          SizedBox(height: 20,),
          Text(content,textAlign: TextAlign.center,style: GoogleFonts.poppins(
            color: ColorSys.gray,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          )
          ),
        ],
      ),
    );
  }



  Widget _indicator(isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: 8,
      width: isActive?30:8,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: ColorSys.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }


  List<Widget> _buildIndicator(){
    List<Widget> indicators=[];
    for(int i=0;i<3;i++) {
      if(initialPage==i) {
        indicators.add(_indicator(true));
      }
      else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

}


