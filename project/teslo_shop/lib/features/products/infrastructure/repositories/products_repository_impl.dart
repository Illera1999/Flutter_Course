

import 'package:teslo_shop/features/products/domain/domain.dart';

class ProductsRepositoryImpl extends ProductsRepositories {
  

  final ProductsDatasource datasource;
  ProductsRepositoryImpl(this.datasource);


  @override
  Future<Product> creatUpdateProduct(Map<String, dynamic> productLike) {
    return datasource.creatUpdateProduct(productLike);
    
  }

  @override
  Future<List<Product>> getAllProducts({int limit = 10, int offset = 0}) {
    return datasource.getProductsByPage(limit: limit, offset: offset);
  }

  @override
  Future<Product> getProductById(String productId) {
    return datasource.getProductById(productId);
  }

  @override
  Future<List<Product>> searchProductByTerm(String term) {
    return datasource.searchProductByTerm(term);
  }
}