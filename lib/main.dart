import 'package:ecommerceapp1/pages/home.dart';
import 'package:ecommerceapp1/pages/login.dart';
import 'package:ecommerceapp1/pages/splash_screen.dart';
import 'package:ecommerceapp1/provider/featured_product_provider.dart';
import 'package:ecommerceapp1/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => UserProvider.initialize(),
      ),
      ChangeNotifierProvider(
        create: (_) => FeaturedProductProvider(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenController(),
      theme: ThemeData(primaryColor: Colors.deepOrange),
    ),
  ));
}

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch (user.status) {
      case Status.Uninitialized:
        return SplashScreen();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return Home();
      default:
        return Login();
    }
  }
}
