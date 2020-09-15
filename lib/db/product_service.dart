import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:ecommerceapp1/models/productmodel.dart';

class ProductService {
  Firestore _firestore = Firestore.instance;
  String ref = "products";
  Future<List<ProductModel>> getFeaturedProducts() =>
      _firestore.collection(ref).getDocuments().then((snap) {
        List<ProductModel> featuredProducts = [];
        snap.documents.map((snapshot) =>
            featuredProducts.add(ProductModel.fromSnapshot(snapshot)));
        return featuredProducts;
      });
}
