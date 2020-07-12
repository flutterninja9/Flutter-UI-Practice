import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui16/detailsShow.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: null,
        title: Text("Shoes",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none,color: Colors.black,size: 27,),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart,color: Colors.black,size: 27,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(18),
          child: Column(
            children: [
              Container(
                height: 40,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    AspectRatio(
                      aspectRatio: 2.2/1,
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(child: Text("All",style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,color: Colors.black),)),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2/1,
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(child: Text("Sneakers",style: GoogleFonts.montserrat(fontWeight: FontWeight.w400,color: Colors.black),)),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2/1,
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(child: Text("Football",style: GoogleFonts.montserrat(fontWeight: FontWeight.w400,color: Colors.black),)),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 2.8/1,
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(child: Text("Casual",style: GoogleFonts.montserrat(fontWeight: FontWeight.w400,color: Colors.black),)),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 2.8/1,
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(child: Text("Party",style: GoogleFonts.montserrat(fontWeight: FontWeight.w400,color: Colors.black),)),
                      ),
                    ),
                  ],
                )
              ),
              SizedBox(
                height: 24,
              ),
              makeWidget(title: "Nike",img: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',price: "\$100"),
              makeWidget(title: "Nike Top",img: 'https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',price: "\$135"),
              makeWidget(title: "Shi-Yang",img: 'https://images.unsplash.com/photo-1565831484041-a67e2ba7287c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',price: "\$155"),
              makeWidget(title: "Woodland",img: 'https://images.unsplash.com/photo-1557870187-4304e2c2b357?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',price: "\$155"),
            ],
          ),
        ),
      ),
    );
  }


  Widget makeWidget({img,title,price}) {
    return Hero(
      tag: "a"+title,
      child:GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Detail(title: title,image: img)
            ),
          );
        },
        child: Container(
          height: 250,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(img),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sneakers",style: GoogleFonts.poppins(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),),
                        Text(title,style: GoogleFonts.poppins(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w400),),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(Icons.favorite_border,color: Colors.grey[900],size: 28,),
                    ),
                  ],
                ),
                Container(
                  child: Text(price,style: GoogleFonts.poppins(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w500),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
