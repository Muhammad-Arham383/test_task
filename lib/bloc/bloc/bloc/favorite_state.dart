part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteState {
  final List<Product> favoriteProducts;

  const FavoriteState(this.favoriteProducts);
}

class FavoriteInitial extends FavoriteState {
  FavoriteInitial() : super([]);
}

class FavoriteUpdated extends FavoriteState {
  const FavoriteUpdated(List<Product> favoriteProducts)
      : super(favoriteProducts);
}
