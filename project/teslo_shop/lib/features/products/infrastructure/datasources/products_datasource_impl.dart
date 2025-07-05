import 'package:dio/dio.dart';
import 'package:teslo_shop/config/config.dart';
import 'package:teslo_shop/features/products/domain/domain.dart';
import 'package:teslo_shop/features/products/infrastructure/mappers/product_mapper.dart';

class ProductsDatasourcesImpl extends ProductsDatasource {
  late final Dio dio;
  final String accessToken;
  ProductsDatasourcesImpl({required this.accessToken})
      : dio = Dio(BaseOptions(
          baseUrl: Encironment.apiUrl,
          headers: {'Authorization': 'Bearer $accessToken'},
        ));

  @override
  Future<Product> creatUpdateProduct(Map<String, dynamic> productLike) {
    // TODO: implement creatUpdateProduct
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProductsByPage(
      {int limit = 10, int offset = 0}) async {
    final response = await dio.get<List>(
      '/products',
      queryParameters: {
        'limit': limit,
        'offset': offset,
      },
    );
    final List<Product> products = response.data!
        .map((product) => ProductMapper.jsonToEntity(product))
        .toList();
    return products;
  }

  @override
  Future<Product> getProductById(String productId) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> searchProductByTerm(String term) {
    // TODO: implement searchProductByTerm
    throw UnimplementedError();
  }
}
