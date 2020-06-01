import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:ui10/plants.dart';

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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController=TabController(vsync: this,length: 4);
  }

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Color.fromRGBO(50, 160, 96, 1),systemNavigationBarColor: Color.fromRGBO(50, 160, 96, 1)));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent,systemNavigationBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: null,
                icon: SvgPicture.asset('assets/align-left.svg',color: Colors.grey,height: 30,),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Material(
                  type: MaterialType.circle,
                  color: Colors.grey.withOpacity(0.2),
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.shopping_cart,color: Colors.grey[800],size: 25,),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 15),
            child: Text('Top Picks',style: GoogleFonts.montserrat(fontSize: 40),),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            padding: EdgeInsets.only(left: 0,top: 15),
            child: TabBar(
              unselectedLabelColor: Colors.grey,
              controller: _tabController,
              labelColor: Colors.black,
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text("Top",style: GoogleFonts.montserrat(fontSize: 18,fontWeight: FontWeight.w500),),
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Outdoor",style: GoogleFonts.montserrat(fontSize: 18,fontWeight: FontWeight.w500),),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Indoor",style: GoogleFonts.montserrat(fontSize: 18,fontWeight: FontWeight.w500),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Tab(
                    child: Text("Plant",style: GoogleFonts.montserrat(fontSize: 18,fontWeight: FontWeight.w500),),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height-250,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                PlantDetails(),
                PlantDetails(),
                PlantDetails(),
                PlantDetails(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
