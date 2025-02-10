part of 'product_api_bloc.dart';

sealed class ProductEvents {}

class FetchProductsEvent extends ProductEvents {}

class FetchProductsByCategoryEvent extends ProductEvents {
  final String categorySlug;

  FetchProductsByCategoryEvent(this.categorySlug);
}
