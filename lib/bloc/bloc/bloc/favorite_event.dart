part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteEvent {}

class AddToFavorites extends FavoriteEvent {
  final Product product;

  AddToFavorites(this.product);
}

class RemoveFromFavorites extends FavoriteEvent {
  final Product product;

  RemoveFromFavorites(this.product);
}
