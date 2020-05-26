import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
  home: MyHomePage(),
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    fontFamily: 'MontSerrat',
  ),
));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int photoIndex=0;
  List<String> photos = [
    'assets/burger-1.jpg',
    'assets/burger-2.jpg',
    'assets/burger-3.jpg',
    'assets/burger-4.jpg',
    'assets/burger-5.jpg',
  ];

  List<String> burgers = ["Cinnamon Snail","Angus burger","Barbecue burge","Butter burger","Carolina burger"];

  void _previousImage() {
    setState(() {
      photoIndex= photoIndex==0?0:photoIndex-1;
    });
  }


  void _nextImage() {
    setState(() {
      photoIndex=photoIndex<photos.length-1?photoIndex+1:photoIndex;
    });
  }
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.orange,
            leading: IconButton(
              onPressed: () {},
              iconSize: 30,
              icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
            ),
            title: Text("BurgerLy",style: TextStyle(color: Colors.grey[300]),),
            centerTitle: true,
            actions: <Widget>[
              Container(
                child: SvgPicture.asset('assets/like.svg',height: 30,),
              ),
              SizedBox(width: 20,),
            ],
            expandedHeight: 450,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 474,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 474,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
                            image: DecorationImage(
                              image: AssetImage(photos[photoIndex]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 440,
                          left: width/4,
                          right: width/4,
                          child: Center(child: SelectedPhoto(noOfDots: photos.length,photoIndex: photoIndex,)),
                        ),
                        Positioned(
                          child: GestureDetector(
                            onHorizontalDragEnd: (drag) {
                              _previousImage();
                            },
                            child: Container(
                              width: width/2,
                              color: Colors.transparent,
                              height: 474,
                            ),
                          ),
                        ),
                        Positioned(
                          left: width/2,
                          child: GestureDetector(
                            onHorizontalDragEnd: (drag) {
                              _nextImage();
                            },
                            child: Container(
                              width: width/2,
                              color: Colors.transparent,
                              height: 474,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.only(top: 25,left: 10),
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("OPEN NOW UNTILL 7PM",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),),
                          SizedBox(width: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(Icons.star,color: Colors.orange,),
                              Icon(Icons.star,color: Colors.orange,),
                              Icon(Icons.star,color: Colors.orange,),
                              Icon(Icons.star,color: Colors.orange,),
                              Icon(Icons.star,color: Colors.grey,),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      AnimatedContainer(curve: Curves.easeIn,
                          duration: Duration(milliseconds: 300),child: Text(burgers[photoIndex],style: TextStyle(fontSize: 35),)),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("17th st & Union sq. East",style: TextStyle(color: Colors.grey[600]),),
                          SizedBox(width:15),
                          Row(
                            children: <Widget>[
                              Icon(Icons.location_on,color: Colors.grey[800],),
                              SizedBox(width: 2),
                              Text("70ft Away",style: TextStyle(color: Colors.grey[800]),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.rss_feed,color: Colors.green,),
                          SizedBox(width: 2,),
                          Text("Location confirmed by 3 users today.",style: TextStyle(color: Colors.green),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: 60,
                        height: 5,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 20,),
                      Text("FEATURED ITEMS",style: TextStyle(color: Colors.grey[700],fontSize: 18),),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 530,
                  child: ListView(
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                       featured(name: "Chili burger",image: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Chili_burger_%28cropped%29.jpg/186px-Chili_burger_%28cropped%29.jpg",ingred:"Mustard, Onion ,Oil, Bread, etc..",price: "25.00"),
                       featured(name: "Luther burger",image: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Doughnut_burger.jpg/186px-Doughnut_burger.jpg",ingred:"Mustard, Onion ,Oil, Bread , etc..",price: "35.21"),
                       featured(name: "Salmon burger",image: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Salmon_burger_%28cropped%29.jpg/186px-Salmon_burger_%28cropped%29.jpg",ingred:"Mustard, Onion ,Oil, Bread , etc..",price: "15.55"),
                       featured(name: "Teriyaki burger",image: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/McDonald%27s_Sunshine_City_%284%29.jpg/186px-McDonald%27s_Sunshine_City_%284%29.jpg",ingred:"Mustard, Onion ,Oil, Bread , etc..",price: "18.96"),
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
  Widget featured({name,image,ingred,price}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 150,
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(name,style: TextStyle(fontSize: 20),),
              ),
              SizedBox(height: 1,),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 8),
                  child: Text(ingred,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 12,color: Colors.grey),),
                ),
              ),
              SizedBox(height: 45,),
              Container(
                padding: const EdgeInsets.only(left:8.0,right: 8),
                child: Text('\$'+price,style: TextStyle(fontSize: 30),),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

class SelectedPhoto extends StatelessWidget {
  int noOfDots;
  int photoIndex;

  SelectedPhoto({this.noOfDots,this.photoIndex});

  Widget _InActivePhoto() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 3,right: 3),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _ActivePhoto() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 5,right: 5),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  List<Widget> buildDots() {
    List<Widget> dots=[];
    for(int i=0;i<noOfDots;i++) {
      dots.add(
          i==photoIndex?_ActivePhoto():_InActivePhoto()
      );
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:buildDots(),
      ),
    );
  }
}


