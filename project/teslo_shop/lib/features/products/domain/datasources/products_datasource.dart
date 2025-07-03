


import 'package:teslo_shop/features/products/domain/entities/product.dart';

abstract class ProductsDatasource {
  Future<List<Product>> getProductsByPage({
    int limit = 10,
    int offset = 0,
  });

  Future<Product> getProductById(String productId);

  Future<List<Product>> searchProductByTerm(String term);

  Future<Product> creatUpdateProduct(Map<String, dynamic> productLike);

}