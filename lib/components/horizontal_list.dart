import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_loaction: 'https://cdn.onlinewebfonts.com/svg/img_472072.png',
            image_caption: 'Shirt',
          ),
          Category(
            image_loaction:
                'https://webstockreview.net/images/dress-clipart-black-and-white.png',
            image_caption: "Dress",
          ),
          Category(
            image_loaction:
                'https://canvas-media.suitopia.com/var/productdesigner/tabs/Waistcoat.png',
            image_caption: 'Formal',
          ),
          Category(
            image_loaction:
                'https://images.vexels.com/media/users/3/142678/isolated/preview/ef2ab8b427ad309ab291f2e063732754-icono-de-pantalones-cortos-de-jeans-by-vexels.png',
            image_caption: 'Pants',
          ),
          Category(
            image_loaction: 'http://cdn.onlinewebfonts.com/svg/img_473618.png',
            image_caption: 'Shoe',
          ),
          Category(
            image_loaction:
                'https://cdn3.iconfinder.com/data/icons/40-apparel-icons/48/svg-09-hoodie-256.png',
            image_caption: 'Informal',
          ),
          Category(
            image_loaction:
                'https://image.flaticon.com/icons/png/512/20/20002.png',
            image_caption: 'Othes',
          )
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_loaction;
  final String image_caption;

  const Category({Key key, this.image_loaction, this.image_caption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      // padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {},
        child: ListTile(
          title: Image.network(
            image_loaction,
            fit: BoxFit.fill,
          ),
          subtitle: Text(
            image_caption,
            style: TextStyle(color: Colors.black, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
