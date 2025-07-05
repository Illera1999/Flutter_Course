import 'package:teslo_shop/features/auth/infrastructure/infrastructure.dart';
import 'package:teslo_shop/features/products/domain/domain.dart';
import 'package:teslo_shop/config/constants/environment.dart';

class ProductMapper {
  static Product jsonToEntity(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: double.parse(json['price'].toString()),
      description: json['description'],
      slug: json['slug'],
      stock: json['stock'],
      gender: json['gender'],
      sizes: List<String>.from(json['sizes'].map((size) => size)),
      tags: List<String>.from(json['tags'].map((tags) => tags)),
      images: List<String>.from(json['images'].map(
        (image) => image.startsWith('http')
            ? image
            : '${Encironment.apiUrl}files/product/$image',
      )),
      user: UserMapper.userJsonToEntity(json['user']),
    );
  }
}
