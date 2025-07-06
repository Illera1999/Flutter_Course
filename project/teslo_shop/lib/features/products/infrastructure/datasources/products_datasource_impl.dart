import 'package:dio/dio.dart';
import 'package:teslo_shop/config/config.dart';
import 'package:teslo_shop/features/products/domain/domain.dart';
import 'package:teslo_shop/features/products/infrastructure/error/product_errors.dart';
import 'package:teslo_shop/features/products/infrastructure/mappers/product_mapper.dart';

class ProductsDatasourcesImpl extends ProductsDatasource {
  late final Dio dio;
  final String accessToken;
  ProductsDatasourcesImpl({required this.accessToken})
      : dio = Dio(BaseOptions(
          baseUrl: Environment.apiUrl,
          headers: {'Authorization': 'Bearer $accessToken'},
        ));



  Future<String> _uploadFile(String path) async {
    try{
      final fileName = path.split('/').last;
      final FormData data = FormData.fromMap({
        'file': MultipartFile.fromFileSync(path, filename: fileName)
      });
      final response = await dio.post('/files/product', data: data);
      return response.data['image'];
    } catch (e){
      throw Exception();
    }
  }

  Future<List<String>> _uploadPhotos(List<String> photo) async {
    final photosToUpload = photo.where((element) => element.contains('/')).toList();
    final photosToIgnore = photo.where((element) => !element.contains('/')).toList();

    final List<Future<String>> uploadJob = photosToUpload.map(
      (element) => _uploadFile(element)
    ).toList();
    final newImages = await Future.wait(uploadJob);



    return [...photosToIgnore, ...newImages ];

  }

  @override
  Future<Product> creatUpdateProduct(Map<String, dynamic> productLike) async {
    try{
      final String? productId = productLike['id'];
      final String method = (productId == null) ? 'POST': 'PATCH';
      final String url = (productId == null ) ? '/products': '/products/$productId';
      productLike.remove('id');
      productLike['images'] = await _uploadPhotos(productLike['images']);
      final response = await  dio.request(
        url,
        data: productLike,
        options: Options(
          method: method
        )
      );
      final product = ProductMapper.jsonToEntity(response.data);
      return product;
    } catch (e) {
      throw Exception();
    }
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
  Future<Product> getProductById(String id) async {
    try {
      final response = await dio.get('/products/$id');
      final product = ProductMapper.jsonToEntity(response.data!);
      return product;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw ProductErrors();
      } else {
        throw Exception('Error fetching product: ${e.message}');
      }
    } catch (e) {
      throw Exception('Error fetching product by ID: $e');
    }
  }

  @override
  Future<List<Product>> searchProductByTerm(String term) {
    // TODO: implement searchProductByTerm
    throw UnimplementedError();
  }
}
