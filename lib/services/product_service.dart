import 'package:delivery_app/models/product.dart';

class ProductService {
  Future<Product> findById(int id) async {
    var product = Product(
      id: id,
      name: 'Caixa de ferramentas',
    );
    return product;
  }


  Future<List<Product>> findAllByStoreId(int storeId) async {
    return <Product>[
      Product(id: 1, name: "Caixa de ferramentas"),
      Product(id: 2, name: "Chave de fenda"),
    ];
  }
}
