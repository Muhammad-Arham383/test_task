import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task/models/product.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<AddToFavorites>((event, emit) {
      final updatedFavorites = List<Product>.from(state.favoriteProducts)
        ..add(event.product);
      emit(FavoriteUpdated(updatedFavorites));
    });

    on<RemoveFromFavorites>((event, emit) {
      final updatedFavorites = List<Product>.from(state.favoriteProducts)
        ..remove(event.product);
      emit(FavoriteUpdated(updatedFavorites));
    });
  }
}
