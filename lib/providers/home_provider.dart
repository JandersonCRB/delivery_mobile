import 'package:delivery_app/models/product.dart';
import 'package:delivery_app/services/product_service.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  ProductService _productService = ProductService();
  List<Product> _productsList = [];

  List<Product> get productsList => _productsList;

  set productsList(List<Product> value) {
    _productsList = value;
    notifyListeners();
  }

  Future<List<Product>> findProductsByStoreId(int storeId) async {
    List<Product> productsList =
        await _productService.findAllByStoreId(storeId);
    productsList = productsList;
    print("setting");
    return productsList;
  }
}
