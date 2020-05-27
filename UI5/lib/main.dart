import 'package:flutter/cupertino.dart';
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
  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(getColorHexFromStr("#ECE7E0")),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 15,right: 15,top:35),
                      child: Material(
                        elevation: 10,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Search for recipies and channels",
                            prefixIcon: Icon(Icons.search,color: Colors.black,),
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontSize: 16,fontFamily: "Poppins"),
                            contentPadding: EdgeInsets.only(top: 12)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          border: Border(left: BorderSide(
                            color: Colors.orange,
                            width: 3,
                            style: BorderStyle.solid,
                          )),
                        ),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("POPULAR RECIPIES",style: TextStyle(fontSize: 30,fontFamily: 'Bebas'),),
                                Text("THIS WEEK",style: TextStyle(fontSize: 30,fontFamily: 'Bebas'),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 125,
                      padding: EdgeInsets.only(left: 15,top: 0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: <Widget>[
                          menuBox(foodImage: 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',foodName: 'Chow Mein',chef: 'James Gorden',chefImage: 'https://tse1.mm.bing.net/th?id=OIP.3Bfcv5F4tYwGGfr1cbc5LQHaEW&w=257&h=160&c=8&rs=1&qlt=90&dpr=1.25&pid=3.1&rm=2'),
                          menuBox(foodImage: 'https://images.unsplash.com/photo-1562708134-16a9435fefc7?ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',foodName: 'Red Peach Pasta',chef: 'Demi Humm',chefImage: 'https://tse1.mm.bing.net/th?id=OIP.TzTLRvLqtjh_R39seAVTTgHaEK&w=269&h=160&c=8&rs=1&qlt=90&dpr=1.25&pid=3.1&rm=2'),
                          menuBox(foodImage: 'https://images.unsplash.com/photo-1561571523-e2559d41fda6?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',foodName: 'Exotic Crunchies',chef: 'Xuah-Xhi',chefImage: 'https://tse1.mm.bing.net/th?id=OIP.bzvGuyHxTxoosod-DJ6ZUQHaE7&w=263&h=160&c=8&rs=1&qlt=90&dpr=1.25&pid=3.1&rm=2'),
                          menuBox(foodImage: 'https://images.unsplash.com/photo-1485704686097-ed47f7263ca4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1069&q=80',foodName: 'Chicken Breast',chef: 'Madame Nora',chefImage: 'https://tse1.mm.bing.net/th?id=OIP.Ivia5zzb2JjtpSw16c3DzQHaHa&w=178&h=160&c=8&rs=1&qlt=90&dpr=1.25&pid=3.1&rm=2'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.only(left: 15,right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("June 7",style: TextStyle(fontFamily: 'Poppins',fontSize: 18,color: Colors.grey[700]),),
                  Text("TODAY",style: TextStyle(fontFamily: 'Bebas',fontSize: 45,color: Colors.grey[900]),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                height: height-460,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage('https://images.unsplash.com/photo-1507273026339-31b655f3752d?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("BEST OF\nTHE DAY",style: TextStyle(fontSize: 50,color: Colors.white,fontFamily: 'Bebas'),),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget menuBox({foodName,chef,foodImage,chefImage}) {
    return Container(
      height: 125,
      width: 270,
      margin: EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: 125,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(foodImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(foodName,style: TextStyle(fontSize: 17,fontFamily: 'Poppins',color: Colors.grey[700],fontWeight: FontWeight.w600),),
                SizedBox(height: 15,),
                Container(
                  height: 2,
                  decoration: BoxDecoration(
                    border: Border(left: BorderSide(
                        color: Colors.orange,
                        width: 50
                    )),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(chefImage),
                      radius: 15,
                    ),
                    SizedBox(width: 8,),
                    Flexible(child: Text(chef,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 15,color: Colors.grey[600],fontWeight: FontWeight.w600),)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}


