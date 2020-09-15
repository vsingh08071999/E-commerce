import 'package:ecommerceapp1/pages/home.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final prod_detail_name;
  final prod_detail_picture;
  final prod_detail_oldPrice;
  final prod_detail_Price;

  const ProductDetails(
      {Key key,
      this.prod_detail_name,
      this.prod_detail_picture,
      this.prod_detail_oldPrice,
      this.prod_detail_Price})
      : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Text('FashApp'),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
              footer: Container(
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "\$ ${widget.prod_detail_oldPrice}",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            decoration: TextDecoration.lineThrough),
                      ),
                      Text(
                        "\$ ${widget.prod_detail_Price}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      )
                    ],
                  ),
                  leading: Text(
                    widget.prod_detail_name,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                ),
                color: Colors.white70,
              ),
              child: Image.network(
                widget.prod_detail_picture,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 1,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Size",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w700),
                            ),
                            content: Text("Choose the Size",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400)),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text(
                                  "Close",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 20),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Size',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 28,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 1,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Color",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w700),
                            ),
                            content: Text("Choose the Color",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400)),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text(
                                  "Close",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 20),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Color',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 28,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 1,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Quantity",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w700),
                            ),
                            content: Text("Choose the Quantity",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400)),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text(
                                  "Close",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 20),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Qty',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 28,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  textColor: Colors.white,
                  color: Colors.red,
                  child: Text(
                    "Buy",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.red,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                  size: 30,
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            title: Text(
              'Product Details',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              "this cloth is very expansive bcoz it have too much time to create and it is created by Asom. dbajkhduiyhiehdaj hoahdjkhwjkd  djskbd  dwuhd  duwd ",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                child: Text(
                  "Product name",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  widget.prod_detail_name,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                child: Text(
                  "Product brand",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  "Brand X",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                child: Text(
                  "Product condition",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  "Condition X",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
          ),
          Container(height: 400, child: SimilarProducts())
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var product_list = [
    {
      "name": "Blazer",
      "picture":
          "https://ae01.alicdn.com/kf/HTB1G5AWNpXXXXbdXFXXq6xXFXXXw/Men-Korean-Slim-Fit-Fashion-Cotton-Blazer-Suit-Jacket-Black-Blue-Beige-Plus-Size-M-to.jpg",
      "Old_price": 120,
      "Price": 80
    },
    {
      "name": "Jeans",
      "picture":
          "https://ae01.alicdn.com/kf/HTB1G5AWNpXXXXbdXFXXq6xXFXXXw/Men-Korean-Slim-Fit-Fashion-Cotton-Blazer-Suit-Jacket-Black-Blue-Beige-Plus-Size-M-to.jpg",
      "Old_price": 120,
      "Price": 80
    },
    {
      "name": "Pant",
      "picture":
          "http://bpc.h-cdn.co/assets/16/38/1474377310-brooks-blazer.jpg",
      "Old_price": 120,
      "Price": 80
    },
    {
      "name": "Shirt",
      "picture":
          "http://bpc.h-cdn.co/assets/16/38/1474377310-brooks-blazer.jpg",
      "Old_price": 120,
      "Price": 80
    },
    {
      "name": "Shoes",
      "picture":
          "https://ae01.alicdn.com/kf/HTB1G5AWNpXXXXbdXFXXq6xXFXXXw/Men-Korean-Slim-Fit-Fashion-Cotton-Blazer-Suit-Jacket-Black-Blue-Beige-Plus-Size-M-to.jpg",
      "Old_price": 120,
      "Price": 80
    },
    {
      "name": "Formals",
      "picture":
          "http://bpc.h-cdn.co/assets/16/38/1474377310-brooks-blazer.jpg",
      "Old_price": 120,
      "Price": 80
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //shrinkWrap: true,
      //scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return SimilarSingleProduct(
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

class SimilarSingleProduct extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final int prod_oldPrice;
  final int prod_price;

  const SimilarSingleProduct(
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
