import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
        fontFamily: 'Poppins'
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isTouch=false;
  List<bool> touchData=[false,false,false,false];
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Color.fromRGBO(188, 156, 27,1)));
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.amber,
        items: <Widget>[
          Icon(Icons.home,size: 30,),
          Icon(Icons.history,size: 30,),
          Icon(Icons.shopping_cart,size: 30,),
          Icon(Icons.settings,size: 30,),
        ],
        onTap: (icon) {},
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://images.unsplash.com/photo-1533891244820-1d2dbcf93f56?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.yellowAccent,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.white,
                              width: 2.5,
                            ),
                            image: DecorationImage(
                              image: NetworkImage('https://images.unsplash.com/photo-1517347902462-b68a532b64a2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=950&q=80'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          child: SvgPicture.asset('assets/align-center.svg',color: Colors.white,height: 40,),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top:90,
                    left: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Hello, Pino",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.grey[900]),),
                        Text("What do you want to buy?",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.grey[900]),),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 222,
                    left: 15,
                    right: 15,
                    child: Container(
                      height: 50,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                        boxShadow: [
                          BoxShadow(color: Colors.grey,offset: Offset(0,3),spreadRadius: 1.5,blurRadius: 4),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        cursorColor: Colors.amber,
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search,color: Colors.amber,),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    padding: EdgeInsets.all(8),
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: Offset(-3,10),
                          spreadRadius: 2,
                          blurRadius: 10
                        ),
                      ],
                    ),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              margin: EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  SvgPicture.asset('assets/sofa.svg'),
                                  Text("Sofa",style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  touchData[0]=!touchData[0];
                                });
                              },
                              child: AnimatedContainer(
                                curve: Curves.easeIn,
                                duration: Duration(milliseconds: 300),
                                height: 130,
                                width: width/4+20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: isTouched(isTouch: touchData[0]),
                                ),
                                child: touchData[0]==true?Icon(Icons.done,color: Colors.white,size: 40,):SizedBox(height: 1,),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20,),
                        Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  SvgPicture.asset('assets/wardrobe.svg'),
                                  Text("Wardrobe",style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  touchData[1]=!touchData[1];
                                });
                              },
                              child: AnimatedContainer(
                                curve: Curves.easeIn,
                                duration: Duration(milliseconds: 300),
                                height: 130,
                                width: width/4+20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: isTouched(isTouch: touchData[1]),
                                ),
                                child: touchData[1]==true?Icon(Icons.done,color: Colors.white,size: 40,):SizedBox(height: 1,),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 40,),
                        Stack(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              margin: EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  SvgPicture.asset('assets/desk.svg'),
                                  Text("Desk",style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  touchData[2]=!touchData[2];
                                });
                              },
                              child: AnimatedContainer(
                                curve: Curves.easeIn,
                                duration: Duration(milliseconds: 300),
                                height: 130,
                                width: width/4+20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: isTouched(isTouch: touchData[2]),
                                ),
                                child: touchData[2]==true?Icon(Icons.done,color: Colors.white,size: 40,):SizedBox(height: 1,),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20,),
                        Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  SvgPicture.asset('assets/dresser.svg'),
                                  Text("Dresser",style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  touchData[3]=!touchData[3];
                                });
                              },
                              child: AnimatedContainer(
                                curve: Curves.easeIn,
                                duration: Duration(milliseconds: 300),
                                height: 130,
                                width: width/4+20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: isTouched(isTouch: touchData[3]),
                                ),
                                child: touchData[3]==true?Icon(Icons.done,color: Colors.white,size: 40,):SizedBox(height: 1,),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20,),
          FurnitureCard(image:'https://images.unsplash.com/photo-1567538096630-e0c55bd6374c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=633&q=80',title: 'Finnaven',price: '\$248',isliked:true ),
          FurnitureCard(image:'https://images.unsplash.com/photo-1584901723137-bde3633dc2c2?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',title: 'Daisy Sofa',price: '\$218',isliked:false ),
          FurnitureCard(image:'https://images.unsplash.com/photo-1578653282816-a508bd2d0435?ixlib=rb-1.2.1&auto=format&fit=crop&w=734&q=80',title: 'Daisy Sofa',price: '\$218',isliked:true ),
        ],
      ),
    );
  }

  Color isTouched({isTouch}) {
    return isTouch==true?Colors.amber:Colors.transparent;
  }

  Widget FurnitureCard({image,title,des,price,isliked}) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
      height: 200,
      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: Offset(-1,10),
            blurRadius: 5,
            spreadRadius: 3

          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: 200,
            width:150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                     Text( title,style: TextStyle(fontSize: 18),),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: Material(
                          color: Colors.white,
                          elevation: 5,
                          type: MaterialType.circle,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite,color: isliked==true?Colors.red:Colors.black,),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8,top: 0),
                  child: Text("Chapter too parties its letters nor.Chapter too parties its letters nor.",style: TextStyle(),),
                ),
                SizedBox(height: 20,),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 61,
                  width: 242,
                  color: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment(0,0),
                        height: 60,
                        width: 50,
                        color: Colors.amber,
                        child: Text(price,style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(width: 20,),
                      Center(
                        child: Container(
                          alignment: Alignment(0,0),
                          height: 60,
                          color: Colors.yellow,
                          child: Text("Add to Cart",style: TextStyle(fontSize: 18,color: Colors.grey[800],fontWeight: FontWeight.bold),),
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
    );
  }
}

