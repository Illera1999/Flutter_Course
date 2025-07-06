


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/products/domain/domain.dart';
import 'package:teslo_shop/features/products/presentation/providers/providers.dart';



final productProvider = StateNotifierProvider.autoDispose.family<ProductNotifier, ProductState, String>(
  (ref, id) {
    final productsRepository = ref.watch(productsRepositoryProvider);
    return ProductNotifier(productsRepository: productsRepository, id: id);
  },
);


class ProductNotifier extends StateNotifier<ProductState> {
  final ProductsRepositories productsRepository;

  ProductNotifier({
    required this.productsRepository,
    required String id,
  }) : super(ProductState(id: id)) {
    loadProduct();
  }

  Product newEmptyProduct(){
    return Product(
      id: 'new', 
      title: '', 
      price: 0, 
      description: '', 
      slug: '', 
      stock: 0, 
      sizes: ['XS'], 
      gender: 'men', 
      tags: [], 
      images: [], 
    );
  }

  Future<void> loadProduct() async {
    try {

      if( state.id == 'new'){
        state = state.copyWith(
          isLoading: false,
          product: newEmptyProduct()
        );
        return;
      }
      
      state = state.copyWith(isLoading: true);
      final product = await productsRepository.getProductById(state.id);
      state = state.copyWith(product: product, isLoading: false);
    } catch (e) {
      print(e);
      // Handle error, e.g., show a message or log it
    }
  }

  // Future<void> saveProduct(Product product) async {
  //   state = state.copyWith(isSaving: true);
  //   await productsRepository.creatUpdateProduct( );
  //   state = state.copyWith(isSaving: false, product: product);
  // }
}




class ProductState {


  final String id;
  final Product? product;
  final bool isLoading;
  final bool isSaving;

  ProductState({
    required this.id,
    this.product,
    this.isLoading = true,
    this.isSaving = false,
  });

  ProductState copyWith({
    String? id,
    Product? product,
    bool? isLoading,
    bool? isSaving,
  }) {
    return ProductState(
      id: id ?? this.id,
      product: product ?? this.product,
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
    );
  }

}