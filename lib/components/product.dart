import 'package:ecommerceapp1/pages/productDetails.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var product_list = [
    {
      "name": "Blazer",
      "picture":
          "https://ae01.alicdn.com/kf/HTB1G5AWNpXXXXbdXFXXq6xXFXXXw/Men-Korean-Slim-Fit-Fashion-Cotton-Blazer-Suit-Jacket-Black-Blue-Beige-Plus-Size-M-to.jpg",

      //"images/c1.jpg",
      "Old_price": 120,
      "Price": 80
    },
    {
      "name": "Jeans",
      "picture":
          "https://ae01.alicdn.com/kf/HTB1G5AWNpXXXXbdXFXXq6xXFXXXw/Men-Korean-Slim-Fit-Fashion-Cotton-Blazer-Suit-Jacket-Black-Blue-Beige-Plus-Size-M-to.jpg",

      //"images/w4.jpeg",
      "Old_price": 120,
      "Price": 80
    },
    {
      "name": "Pant",
      "picture":
          "http://bpc.h-cdn.co/assets/16/38/1474377310-brooks-blazer.jpg",

      //"images/m2.jpg",
      "Old_price": 120,
      "Price": 100
    },
    {
      "name": "Shirt",
      "picture":
          "http://bpc.h-cdn.co/assets/16/38/1474377310-brooks-blazer.jpg",

      //"images/w4.jpeg",
      "Old_price": 120,
      "Price": 80
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //shrinkWrap: true,
      //scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
      itemBuilder: (context, index) {
        return SingleProduct(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_oldPrice: product_list[index]['Old_price'],
          prod_price: product_list[index]['Price'],
        );
      },
      itemCount: product_list.length,
    );
  }
}

class SingleProduct extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final int prod_oldPrice;
  final int prod_price;

  const SingleProduct(
      {Key key,
      this.prod_name,
      this.prod_picture,
      this.prod_oldPrice,
      this.prod_price})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
                child: GridTile(
                  child: Image.network(
                    prod_picture,
                    fit: BoxFit.fill,
                  ),
                  footer: Container(
                      // height: 100,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              prod_name,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            "\$ $prod_price",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )),
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductDetails(
                          prod_detail_name: prod_name,
                          prod_detail_picture: prod_picture,
                          prod_detail_oldPrice: prod_oldPrice,
                          prod_detail_Price: prod_price,
                        )))),
          )),
    );
  }
}
