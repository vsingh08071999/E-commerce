import 'package:ecommerceapp1/components/cart_products.dart';
import 'package:flutter/material.dart';

class Carts extends StatefulWidget {
  @override
  _CartsState createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text(
                    "Total :",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    "\$ ${230}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  child: Text(
                    "Check out",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
        body: CartProducts());
  }
}
