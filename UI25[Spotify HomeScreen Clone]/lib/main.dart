import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/animation.dart';
import 'package:cached_network_image/cached_network_image.dart';


void main() => runApp(MaterialApp(
  home: MyHomePage(),
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    accentColor: Colors.black,
    brightness: Brightness.dark
  ),
));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with SingleTickerProviderStateMixin{
  int currIndex=0;
  AnimationController controller;
  Animation animation,headerAnimationA,headerAnimationB,headerAnimationC,headerAnimationD,headerAnimationE;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(duration: Duration(seconds: 1),vsync: this);
    animation=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn
    ));
    headerAnimationA=Tween(begin: 0.3,end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.3,1.0,curve: Curves.easeIn)
    ));
    headerAnimationB=Tween(begin: 0.3,end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.4,1.0,curve: Curves.easeIn)
    ));
    headerAnimationC=Tween(begin: 0.3,end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.5,1.0,curve: Curves.easeIn)
    ));
    headerAnimationD=Tween(begin: 0.3,end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.6,1.0,curve: Curves.easeIn)
    ));
    headerAnimationE=Tween(begin: 0.3,end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.7,1.0,curve: Curves.easeIn)
    ));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    double width=MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: controller,
      builder: (context,child) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            currentIndex: currIndex,
            selectedItemColor: Colors.green,
            onTap: (index) {
              setState(() {
                currIndex=index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(EvaIcons.home),
                title: Text('Home',style: GoogleFonts.poppins(),),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  title: Text('Search',style: GoogleFonts.poppins(),)
              ),
              BottomNavigationBarItem(
                  icon: Icon(EvaIcons.bookmark),
                  title: Text('Library',style: GoogleFonts.poppins(),)
              ),
              BottomNavigationBarItem(
                  icon: Icon(BrandIcons.spotify),
                  title: Text('Plans',style: GoogleFonts.poppins(),)
              ),
            ],
          ),
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                    [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomRight,
                                tileMode: TileMode.clamp,
                                colors: [
                                  Color.fromRGBO(28, 188, 84, 1),
                                  Colors.purple
                                ]
                            )
                        ),
                        child: ListView(
                          primary: true,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 8,right: 10),
                              alignment: Alignment.topRight,
                              child: Icon(Icons.settings,size: 28,),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 0,left: 10,right: 10),
                              child: Transform(
                                transform: Matrix4.translationValues(0.0,width*animation.value, 0.0),
                                  child: Text("Good morning",style: GoogleFonts.poppins(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w600),)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 0,left: 10,right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Transform(
                                    transform: Matrix4.translationValues(0.0,headerAnimationA.value*width,0.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Suggestions(image: 'assets/heart.jpg',promoText: 'Liked Songs'),
                                        Suggestions(image: 'assets/sidhua.jpg',promoText: 'Hip Te Hop'),
                                      ],
                                    ),
                                  ),
                                  Transform(
                                    transform: Matrix4.translationValues(0.0,headerAnimationB.value*width,0.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Suggestions(image: 'assets/desi.jpg',promoText: 'Desi Vibes'),
                                        Suggestions(image: 'assets/headphone.jpg',promoText: 'Bineural Beats'),
                                      ],
                                    ),
                                  ),
                                  Transform(
                                    transform: Matrix4.translationValues(0.0,headerAnimationC.value*width,0.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Suggestions(image: 'assets/divine.jpg',promoText: 'Divine Hits'),
                                        Suggestions(image: 'assets/sleep.jpg',promoText: 'Sleep Sounds'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Transform(
                              transform: Matrix4.translationValues(0.0,headerAnimationB.value*width,0.0),
                              child: Padding(
                                  padding: EdgeInsets.only(top: 20,left: 10,right: 10),
                                  child: Container(
                                    height: 200,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: AssetImage('assets/obama.jpg'),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 5,top: 5),
                                          child: Text("A SPOTIFY ORIGINAL PODCAST",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(left: 5,top: 5),
                                                child: RichText(
                                                  text: TextSpan(
                                                      text: "THE",
                                                      style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),
                                                      children: [
                                                        TextSpan(
                                                          text: "\nMICHELLE OBAMA",
                                                          style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),
                                                        ),
                                                        TextSpan(
                                                          text: "\nPODCAST",
                                                          style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),
                                                        ),
                                                      ]
                                                  ),
                                                )
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5,top: 5),
                                              child: Text("Michelle Obama in conversation, like you've never heard her before.",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            ),
                            Transform(
                              transform: Matrix4.translationValues(0.0,headerAnimationE.value*width,0.0),
                              child: Padding(
                                  padding: EdgeInsets.only(top: 20,left: 10,right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Recently played",style: GoogleFonts.poppins(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w600),),
                                      Container(
                                        height: 200,
                                        width: MediaQuery.of(context).size.width,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            RecentB(image: 'assets/saaho.jpg',title: 'Bad Boy'),
                                            RecentB(image: 'assets/postera.jpg',title: '2020 Hits'),
                                            RecentB(image: 'assets/posterb.jpg',title: 'Music Forever'),
                                            RecentB(image: 'assets/posterc.jpg',title: 'Sidhu Hits'),
                                            RecentB(image: 'assets/posterd.jpg',title: 'Afro Music'),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 20,left: 10,right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Made for you",style: GoogleFonts.poppins(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w600),),
                                    Container(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Recent(image: 'https://i.pinimg.com/474x/cd/58/47/cd5847f3524bdd22a177eb69e0ff4179.jpg',title: 'It was a Dream'),
                                          Recent(image: 'https://i.pinimg.com/originals/47/c8/13/47c813e027e377b4ef0224e152161108.png',title: 'Jay Z Hits'),
                                          Recent(image: 'https://m.media-amazon.com/images/I/51zD3BiHFGL._SR500,500_.jpg',title: 'America Forever'),
                                          Recent(image: 'https://m.media-amazon.com/images/M/MV5BNjRjZjQzZjgtZDVlNi00ODY5LTgyN2MtN2VkZTg2YmNiMGE2XkEyXkFqcGdeQXVyMjU5MzI5Nzc@._V1_.jpg',title: 'Bad Rap'),
                                          Recent(image: 'https://cdn.shopify.com/s/files/1/0747/3829/products/mL2229_6a7b89a9-3ccd-4c3b-89eb-03e0c164d9db.jpg?v=1571445521',title: 'Rap Battle'),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 20,left: 10,right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Recommended radio",style: GoogleFonts.poppins(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w600),),
                                    Container(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Recent(image: 'https://mixmag.asia/assets/uploads/images/_columns2/kshmrspinninasia.jpg',title: 'KSHMR Radio'),
                                          Recent(image: 'https://static.billboard.com/files/media/divine-press-2019-billboard-1548-1024x677.jpg',title: 'Divine Hits'),
                                          Recent(image: 'https://cdn.dnaindia.com/sites/default/files/styles/full/public/2018/05/04/678952-nucleya.jpg',title: 'Nucleya Radio'),
                                          Recent(image: 'https://i.pinimg.com/originals/77/6f/d9/776fd9cbfc017d83b409fc2781bebb15.jpg',title: 'Bohemia Hits'),
                                          Recent(image: 'https://resize.indiatvnews.com/en/resize/newbucket/715_-/2020/03/honey-singh-1584262330.jpg',title: 'Honey Singh Hits'),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 20,left: 10,right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Popular playlists",style: GoogleFonts.poppins(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w600),),
                                    Container(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Recent(image: 'https://s.studiobinder.com/wp-content/uploads/2020/04/What-is-Bollywood-Featured.jpg',title: 'Bollywood'),
                                          Recent(image: 'https://static.billboard.com/files/media/1998-week-fea-art-2018-billboard-1500-768x433.jpg',title: 'Collection 1998'),
                                          Recent(image: 'https://upload.wikimedia.org/wikipedia/commons/2/2b/Billboard_Hot_100_logo.jpg',title: 'Billboards Toppers'),
                                          Recent(image: 'https://previews.123rf.com/images/ingara/ingara1811/ingara181100041/111072750-electronic-music-posters-trance-music-festival-promotion-vector-wave-sound-amplitude-design-abstract.jpg',title: 'Festival Playlist'),
                                          Recent(image: 'https://cdn5.vectorstock.com/i/1000x1000/26/94/rock-music-vintage-poster-with-horns-hand-vector-21152694.jpg',title: 'Hard Rock'),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 20,left: 10,right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Jump back in",style: GoogleFonts.poppins(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w600),),
                                    Container(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Recent(image: 'https://c4.wallpaperflare.com/wallpaper/705/683/646/singers-zayn-malik-english-singer-tattoo-hd-wallpaper-preview.jpg',title: 'Zayn Forever'),
                                          Recent(image: 'https://static.toiimg.com/thumb/msid-76618857,imgsize-94128,width-800,height-600,resizemode-75/76618857.jpg',title: 'Bad'),
                                          Recent(image: 'https://piejuniper2015.files.wordpress.com/2016/05/justin.jpg?w=768',title: 'Sorry'),
                                          Recent(image: 'https://previews.123rf.com/images/ingara/ingara1811/ingara181100041/111072750-electronic-music-posters-trance-music-festival-promotion-vector-wave-sound-amplitude-design-abstract.jpg',title: 'Festival Playlist'),
                                          Recent(image: 'https://www.thegreats.info/wp-wins/uploads/2014/09/a-890x395_c.jpg',title:'Adele'),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                            ),
                            SizedBox(height: 70,),
                          ],
                        ),
                      ),
                    ]
                ),
              )
            ],
          ),
        );
      },
    );
  }


  Widget Suggestions({image,promoText}) {
    return Container(
      height: 70,
      width: 160,
      margin: EdgeInsets.only(right: 10,top: 10),
      decoration: BoxDecoration(
          color: Colors.transparent,
         borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Container(
             width: 60,
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8)),
               image: DecorationImage(
                 image: AssetImage(image),
                 fit: BoxFit.cover
               )
             ),
           ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(promoText,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontWeight: FontWeight.w500,color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }


  Widget Recent({image,title}) {
    return Container(
      height: 200,
      width: 170,
      margin: EdgeInsets.only(top: 8,right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(4))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 0,top: 4),
            child: Text(title,style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),),
          )
        ],
      ),
    );
  }

  Widget RecentB({image,title}) {
    return Container(
      height: 200,
      width: 170,
      margin: EdgeInsets.only(top: 8,right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(4))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
                image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 0,top: 4),
            child: Text(title,style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),),
          )
        ],
      ),
    );
  }


}
