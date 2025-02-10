import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/bloc/bloc/favorite_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state.favoriteProducts.isEmpty) {
            return Center(child: Text('No favorite products yet.'));
          }

          return ListView.builder(
            itemCount: state.favoriteProducts.length,
            itemBuilder: (context, index) {
              final product = state.favoriteProducts[index];
              return ListTile(
                leading: Image.network(
                  product.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(product.title),
                subtitle: Text('\$${product.price}'),
                trailing: IconButton(
                  icon: Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {
                    // Remove from favorites
                    context
                        .read<FavoriteBloc>()
                        .add(RemoveFromFavorites(product));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
