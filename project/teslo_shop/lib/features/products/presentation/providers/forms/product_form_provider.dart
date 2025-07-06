import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:teslo_shop/config/config.dart';
import 'package:teslo_shop/features/products/domain/domain.dart';
import 'package:teslo_shop/features/products/presentation/providers/providers.dart';
import 'package:teslo_shop/features/shared/shared.dart';

final productFormProvider = StateNotifierProvider.autoDispose
    .family<ProductFormNotifier, ProductFormState, Product>(
  (ref, producto) {
    final creatUpdateCallback =
        ref.read(productsProvider.notifier).createOrUpdateProduct;
    return ProductFormNotifier(
        product: producto, onSubmitCallback: creatUpdateCallback);
  },
);

class ProductFormNotifier extends StateNotifier<ProductFormState> {
  final Future<bool> Function(Map<String, dynamic> productLike)?
      onSubmitCallback;

  ProductFormNotifier({
    this.onSubmitCallback,
    required Product product,
  }) : super(ProductFormState(
          id: product.id,
          title: Title.dirty(product.title),
          slug: Slug.dirty(product.slug),
          price: Price.dirty(product.price),
          sizes: product.sizes,
          gender: product.gender,
          inStock: Stock.dirty(product.stock),
          description: product.description,
          tags: product.tags.join(', '),
          images: product.images,
        ));

  Future<bool> onFormSumit() async {
    _touchefEverything();
    if (!state.isFormValid) return false;
    if (onSubmitCallback == null) return false;

    final productsLike = {
      'id': (state.id == 'new') ? null : state.id,
      'title': state.title.value,
      'price': state.price.value,
      'description': state.description,
      'slug': state.slug.value,
      'stock': state.stock.value,
      'sizes': state.sizes,
      'gender': state.gender,
      'tags': state.tags.split(','),
      'images': state.images
          .map((image) =>
              image.replaceAll('${Environment.apiUrl}/files/product/', ''))
          .toList()
    };
    try {
      print(productsLike);
      return await onSubmitCallback!(productsLike);
    } catch (e) {
      return false;
    }
  }

  void _touchefEverything() {
    state = state.copyWith(
        isFormValid: Formz.validate([
      Title.dirty(state.title.value),
      Slug.dirty(state.slug.value),
      Price.dirty(state.price.value),
      Stock.dirty(state.stock.value),
    ]));
  }

  void updateProductImage(String path){
    state = state.copyWith(
      images: [...state.images,path]
    );
  }


  void onTitleChanged(String value) {
    state = state.copyWith(
        title: Title.dirty(value),
        isFormValid: Formz.validate([
          Title.dirty(value),
          Slug.dirty(state.slug.value),
          Price.dirty(state.price.value),
          Stock.dirty(state.inStock.value),
        ]));
  }

  void onSlugChanged(String value) {
    state = state.copyWith(
        slug: Slug.dirty(value),
        isFormValid: Formz.validate([
          Slug.dirty(value),
          Title.dirty(state.title.value),
          Price.dirty(state.price.value),
          Stock.dirty(state.inStock.value),
        ]));
  }

  void onPriceChanged(double value) {
    state = state.copyWith(
        price: Price.dirty(value),
        isFormValid: Formz.validate([
          Price.dirty(value),
          Title.dirty(state.title.value),
          Slug.dirty(state.slug.value),
          Stock.dirty(state.inStock.value),
        ]));
  }

  void onStockChanged(int value) {
    state = state.copyWith(
        stock: Stock.dirty(value),
        isFormValid: Formz.validate([
          Stock.dirty(value),
          Title.dirty(state.title.value),
          Slug.dirty(state.slug.value),
          Price.dirty(state.price.value),
        ]));
  }

  void onSizedChanged(List<String> sizes) {
    state = state.copyWith(size: sizes);
  }

  void onGenderChanged(String gender) {
    state = state.copyWith(gender: gender);
  }

  void onDescriptionChanged(String description) {
    state = state.copyWith(description: description);
  }

  void onTagsChanged(String tags) {
    state = state.copyWith(tags: tags);
  }
}

class ProductFormState {
  final bool isFormValid;
  final String? id;
  final Title title;
  final Slug slug;
  final Price price;
  final List<String> sizes;
  final String gender;
  final Stock inStock;
  final String description;
  final String tags;
  final List<String> images;
  final Stock stock;

  ProductFormState(
      {this.isFormValid = false,
      this.id,
      this.title = const Title.dirty(''),
      this.slug = const Slug.dirty(''),
      this.price = const Price.dirty(0),
      this.sizes = const [],
      this.gender = 'men',
      this.inStock = const Stock.dirty(0),
      this.description = '',
      this.tags = '',
      this.images = const [],
      this.stock = const Stock.dirty(0)});

  ProductFormState copyWith(
          {bool? isFormValid,
          String? id,
          Title? title,
          Slug? slug,
          Price? price,
          List<String>? size,
          String? gender,
          Stock? inStock,
          String? description,
          String? tags,
          List<String>? images,
          Stock? stock}) =>
      ProductFormState(
          isFormValid: isFormValid ?? this.isFormValid,
          id: id ?? this.id,
          title: title ?? this.title,
          slug: slug ?? this.slug,
          price: price ?? this.price,
          sizes: size ?? this.sizes,
          gender: gender ?? this.gender,
          inStock: inStock ?? this.inStock,
          description: description ?? this.description,
          tags: tags ?? this.tags,
          images: images ?? this.images,
          stock: stock ?? this.stock);
}
