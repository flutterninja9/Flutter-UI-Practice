import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui9/main.dart';

class Profile extends StatefulWidget {
  String image,writer;
  List<String> images;
  Profile({this.image,this.writer,this.images});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: widget.image,
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage(widget.image),
                          backgroundColor: Colors.transparent,
                          radius: 100,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child:Text(widget.writer,style: GoogleFonts.montserrat(fontSize: 30,fontWeight: FontWeight.w500),),
                      ),
                      SizedBox(width: 5,),
                      Icon(Icons.done_all,color: Colors.deepOrangeAccent,),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Text("Random Details About The Person.",style: GoogleFonts.poppins(color: Colors.grey,),),
                  SizedBox(height: 3,),
                  Container(
                    height: 120,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("353",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 16),),
                            Text("Photos"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("124",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 16),),
                            Text("Videos"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("17k",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 16),),
                            Text("Likes"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 320,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Photos",style: GoogleFonts.poppins(fontSize: 18),),
                        Text("View All",style: GoogleFonts.poppins(fontSize: 15,color: Colors.orange),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      height: 250,
                      child: GridView.count(
                        primary: false,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        crossAxisCount: 3,
                        children: <Widget>[
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://images.unsplash.com/photo-1528740561666-dc2479dc08ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://images.unsplash.com/photo-1502749617496-980c8fc80f93?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://images.unsplash.com/photo-1569680087741-99ef25ea656a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://images.unsplash.com/photo-1517042244917-7498ac155a51?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://images.unsplash.com/photo-1562546703-42246817382a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://images.unsplash.com/photo-1563703916510-447804c98036?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                height: 220,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Videos",style: GoogleFonts.poppins(fontSize: 18),),
                        Text("View All",style: GoogleFonts.poppins(fontSize: 15,color: Colors.orange),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      height: 170,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            height: 170,
                            margin: EdgeInsets.only(right: 10),
                            width: MediaQuery.of(context).size.width-20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage('https://images.unsplash.com/photo-1513829596324-4bb2800c5efb?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Icon(Icons.play_arrow,color: Colors.white,size: 100,),
                            ),
                          ),
                          Container(
                            height: 170,
                            margin: EdgeInsets.only(right: 10),
                            width: MediaQuery.of(context).size.width-20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage('https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Icon(Icons.play_arrow,color: Colors.white,size: 100,),
                            ),
                          ),
                          Container(
                            height: 170,
                            margin: EdgeInsets.only(right: 10),
                            width: MediaQuery.of(context).size.width-20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage('https://images.unsplash.com/photo-1487180144351-b8472da7d491?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Icon(Icons.play_arrow,color: Colors.white,size: 100,),
                            ),
                          ),
                          Container(
                            height: 170,
                            margin: EdgeInsets.only(right: 10),
                            width: MediaQuery.of(context).size.width-20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage('https://images.unsplash.com/photo-1484755560615-a4c64e778a6c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Icon(Icons.play_arrow,color: Colors.white,size: 100,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
