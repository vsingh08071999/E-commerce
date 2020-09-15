import 'package:ecommerceapp1/db/product_service.dart';
import 'package:ecommerceapp1/models/productmodel.dart';
import 'package:flutter/cupertino.dart';

class FeaturedProductProvider extends ChangeNotifier {
  List<ProductModel> _featuredProduct = [];
  ProductService _productService = ProductService();
  FeaturedProductProvider() {
    _getFeaturedProducts();
  }
  List<ProductModel> get featuredProduct => _featuredProduct;
  void _getFeaturedProducts() async {
    _featuredProduct = await _productService.getFeaturedProducts();
    notifyListeners();
  }
}
