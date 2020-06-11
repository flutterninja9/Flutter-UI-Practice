import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:threeddmusic/Screens/trending.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  int currentIndex=0;
  TabController _controller;
  @override
  void initState() {
    _controller = TabController(vsync: this,length: 5);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromRGBO(64, 207, 104, 1),
        elevation: 0,
        child: Icon(Icons.play_arrow),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/home.svg'),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/disc.svg'),
            ),
            SizedBox(),
            SizedBox(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_basket)
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: TabBar(
          isScrollable: true,
          controller: _controller,
          indicatorColor:Color.fromRGBO(64, 207, 104, 1),
          unselectedLabelColor: Colors.grey[400],
          labelColor: Color.fromRGBO(64, 207, 104, 1),
          tabs: <Widget>[
            Tab(
              text: "Trending",
            ),
            Tab(
              text: "Latest",
            ),
            Tab(
              text: "BlockBuster",
            ),
            Tab(
              text: "LoFi",
            ),
            Tab(
              text: "Bollywood",
            ),
          ],
        ),
        title: Text("Gamma-Music",style: GoogleFonts.quicksand(color: Colors.black,fontWeight: FontWeight.w500),),
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundColor: Color.fromRGBO(64, 207, 104, 1),
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:1.0),
            child: IconButton(
              onPressed: null,
              icon: SvgPicture.asset('assets/search.svg',color: Color.fromRGBO(64, 207, 104, 1),),
            ),
          ),
        ],
      ),
      body: Container(
        height:MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: TabBarView(
          physics: BouncingScrollPhysics(),
          controller: _controller,
          children: <Widget>[
            Container(
              child: Trending(),
            ),
            Container(
              child: Center(
                child: Trending(),
              ),
            ),
            Container(
              child: Center(
                child: Trending(),
              ),
            ),
            Container(
              child: Center(
                child: Trending(),
              ),
            ),
            Container(
              child: Center(
                child: Trending(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
