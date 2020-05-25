import 'package:flutter/material.dart';
import 'package:ui2/fadeanimation.dart';

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
        fontFamily: 'MontSerrat',
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
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios,color: Colors.black87,size: 25,),
        ),
        title: Container(alignment: Alignment(-1.3,0),child: Text("Near by",style: TextStyle(color: Colors.black87,fontSize: 25),)),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/chemistry.png',),
          ),
          SizedBox(width: 8,),
        ],
      ),
      body:Column(
        children: <Widget>[
          FadeAnimation(2.5,
            Container(
              height: 100,
              padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    left: 20.0,
                    child: Container(
                      width: width-100,
                      height: 400.0,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10.0,
                    child: Container(
                      width: width-80,
                      height: 400.0,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    child: Container(
                      width: width-60,
                      height: 400.0,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage('assets/girls.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 375,
                    left: 20,
                    child: Container(
                      height: 80,
                      width: width-100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [BoxShadow(
                          blurRadius: 4,
                          color: Colors.grey,
                          offset: Offset(-2,4),
                        )],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text("Kayla",style: TextStyle(fontSize: 25),),
                                    SizedBox(width: 5,),
                                    SizedBox(height: 30,child: Image.asset('assets/gender.png')),
                                  ],
                                ),
                                Text("5.8Km",style: TextStyle(color: Colors.grey[700]),),
                              ],
                            ),
                            Text("Fate is powerful.",style: TextStyle(color: Colors.grey[700]),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 480,
                    left: 15,
                    child: Container(
                      height: 100,
                      width: width-100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SizedBox(
                            height:45,
                            child: Container(
                              child: InkWell(
                                onTap: () {},
                                child: Image.network('https://image.flaticon.com/icons/png/512/126/126497.png'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            child: Container(
                              child: InkWell(
                                onTap: () {},
                                child: Image.network('https://image.flaticon.com/icons/png/512/126/126516.png'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            child: Container(
                              child: InkWell(
                                onTap: () {},
                                child: Image.network('https://image.flaticon.com/icons/png/512/1216/1216649.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),),
        ],
      ),
    );
  }
}
