import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/auth/presentation/providers/auth_provider.dart';
import 'package:teslo_shop/features/products/infrastructure/infractructure.dart';

final productsRepositoryProvider = Provider<ProductsRepositoryImpl>((ref) {
  final accessToken = ref.watch(authProvider).user?.token ?? '';
  final productsRepository =
      ProductsRepositoryImpl(ProductsDatasourcesImpl(accessToken: accessToken));
  return productsRepository;
});
