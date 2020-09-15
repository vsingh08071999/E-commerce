import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var product_list = [
    {
      "name": "Blazer",
      "picture":
          "https://ae01.alicdn.com/kf/HTB1G5AWNpXXXXbdXFXXq6xXFXXXw/Men-Korean-Slim-Fit-Fashion-Cotton-Blazer-Suit-Jacket-Black-Blue-Beige-Plus-Size-M-to.jpg",
      "price": 80,
      "size": "M",
      "color": "Red",
      "quantity": 2
    },
    {
      "name": "Pant",
      "picture":
          "http://bpc.h-cdn.co/assets/16/38/1474377310-brooks-blazer.jpg",
      "price": 80,
      "size": "XL",
      "color": "Blue",
      "quantity": 1
    },
    {
      "name": "Shirt",
      "picture":
          "https://ae01.alicdn.com/kf/HTB1G5AWNpXXXXbdXFXXq6xXFXXXw/Men-Korean-Slim-Fit-Fashion-Cotton-Blazer-Suit-Jacket-Black-Blue-Beige-Plus-Size-M-to.jpg",
      "price": 80,
      "size": "L",
      "color": "Blue",
      "quantity": 4
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FashApp',
          style: TextStyle(fontSize: 22),
        ),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: 25,
            ),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return SingleCartProduct(
            cart_prod_name: product_list[index]['name'],
            cart_prod_picture: product_list[index]['picture'],
            cart_prod_price: product_list[index]['price'],
            cart_prod_size: product_list[index]['size'],
            cart_prod_color: product_list[index]['color'],
            cart_prod_qty: product_list[index]['quantity'],
          );
        },
        itemCount: product_list.length,
      ),
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  const SingleCartProduct(
      {Key key,
      this.cart_prod_name,
      this.cart_prod_picture,
      this.cart_prod_price,
      this.cart_prod_size,
      this.cart_prod_color,
      this.cart_prod_qty})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Image.network(
          cart_prod_picture,
          fit: BoxFit.fill,
          width: 80,
          height: 80,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              cart_prod_name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            InkWell(
              child: Icon(
                Icons.arrow_drop_up,
                size: 30,
              ),
              onTap: () {},
            )
//            IconButton(
//              onPressed: () {},
//              icon: Icon(
//                Icons.arrow_drop_up,
//                size: 30,
//              ),
//            ),
          ],
        ),
        subtitle: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Size:",
                  style: TextStyle(fontSize: 20),
                ),
                Text(cart_prod_size,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 18)),
                Text(
                  "Color:",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(cart_prod_color,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 18)),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    " ${cart_prod_qty}",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "\$ $cart_prod_price",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 20),
                  ),
                ),
                InkWell(
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                  ),
                  onTap: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
