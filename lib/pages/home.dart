import 'package:ecommerceapp1/components/horizontal_list.dart';
import 'package:ecommerceapp1/components/product.dart';
import 'package:ecommerceapp1/db/product_service.dart';
import 'package:ecommerceapp1/models/productmodel.dart';
import 'package:ecommerceapp1/pages/carts.dart';
import 'package:ecommerceapp1/pages/login.dart';
import 'package:ecommerceapp1/provider/featured_product_provider.dart';
import 'package:ecommerceapp1/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _searchController = TextEditingController();
  GoogleSignIn googleSignIn = GoogleSignIn();
  Widget image_carousel = Container(
    height: 200,
    child: Carousel(
        images: [
          AssetImage('images/1.jpg'),
          AssetImage('images/sale.png'),
          AssetImage('images/c1.jpg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/m2.jpg'),
        ],
        autoplay: true,
        //animationCurve: Curves.fastOutSlowIn,
        indicatorBgPadding: 2,
        dotBgColor: Colors.transparent,
        dotSize: 4),
  );
  _getData() {
    final featuredProducts = Provider.of<FeaturedProductProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final featuredProducts = Provider.of<FeaturedProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepOrange),
        elevation: 0.1,
        backgroundColor: Colors.white,
        title: Material(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[100],
          elevation: 0.0,
          child: TextFormField(
            controller: _searchController,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                hintText: "Search...",
                border: InputBorder.none),
            validator: (value) {
              if (value.isEmpty) {
                return "The search field cannot be empty";
              }
              return null;
            },
          ),
        ),
        actions: <Widget>[
//          IconButton(
//            icon: Icon(
//              Icons.search,
//              size: 25,
//            ),
//            color: Colors.deepOrange,
//            onPressed: () {},
//          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, size: 25),
            color: Colors.deepOrange,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Carts()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "",
                style: TextStyle(fontSize: 20),
              ),
              accountEmail: Text(
                user.firebaseUser.email,
                style: TextStyle(fontSize: 18),
              ),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.red),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Home Page',
                  style: TextStyle(fontSize: 20),
                ),
                leading: Icon(
                  Icons.home,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'My account',
                  style: TextStyle(fontSize: 20),
                ),
                leading: Icon(
                  Icons.person,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'My orders',
                  style: TextStyle(fontSize: 20),
                ),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Carts()));
              },
              child: ListTile(
                title: Text(
                  'Shopping Cart',
                  style: TextStyle(fontSize: 20),
                ),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Favourites',
                  style: TextStyle(fontSize: 20),
                ),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(fontSize: 20),
                ),
                leading: Icon(
                  Icons.settings,
                  // color: Colors.red,
                  size: 30,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'About',
                  style: TextStyle(fontSize: 20),
                ),
                leading: Icon(
                  Icons.help,
                  // color: Colors.red,
                  size: 30,
                ),
              ),
            ),
//            InkWell(
//              onTap: () {
//                _auth.signOut().then((value) => {
//                      Navigator.pushReplacement(context,
//                          MaterialPageRoute(builder: (context) => Login()))
//                    });
////                Navigator.push(
////                    context, MaterialPageRoute(builder: (context) => Login()));
//              },
//              child: ListTile(
//                title: Text(
//                  'SignOut',
//                  style: TextStyle(fontSize: 20),
//                ),
//                leading: Icon(
//                  Icons.lock_open,
//                  // color: Colors.red,
//                  size: 30,
//                ),
//              ),
//            ),
            InkWell(
              onTap: () {
                user.signOut();
//                try {
//                  return await googleSignIn.signOut().then((value) =>
//                      Navigator.pushReplacement(context,
//                          MaterialPageRoute(builder: (context) => Login())));
//                } catch (e) {
//                  print(e.toString());
//                  return null;
//                }
              },
              child: ListTile(
                title: Text(
                  'SignOut from google',
                  style: TextStyle(fontSize: 20),
                ),
                leading: Icon(
                  Icons.lock_open,
                  // color: Colors.red,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        // shrinkWrap: true,
        //physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          image_carousel,
//          Padding(
//            padding: EdgeInsets.symmetric(horizontal: 10),
//            child: Text(
//              "Categories",
//              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
//            ),
//          ),
//          Text(
//            "${featuredProducts.featuredProduct.length}",
//            style: TextStyle(color: Colors.deepOrange, fontSize: 25),
//          ),
//          FutureBuilder(
//            builder: (context, snapshot) {
//              if (snapshot.connectionState == ConnectionState.done)
//                return Container(
//                  height: 150,
//                  width: 150,
//                  child: snapshot.data,
//                );
//              if (snapshot.connectionState == ConnectionState.waiting)
//                return CircularProgressIndicator();
//              return Container(
//                child: Text("Container"),
//              );
//            },
//            future: ,
//          ),
          //Image.network("${user.firebaseUser.photoUrl}"),
//          ListView.builder(
//            itemBuilder: (context, index) {
//              return Text(
//                  "Hello ${featuredProducts.featuredProduct[index].name}");
//            },
//            shrinkWrap: true,
//            itemCount: 0,
//          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Type of Products",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          HorizontalList(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Recent Products",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            height: 300,
            child: Product(),
          )
        ],
      ),
    );
  }
}
