import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/bloc/product_api_bloc.dart';
import 'package:test_task/screens/product_detail_screen.dart';
import 'package:test_task/services/api_services.dart';

class ProductsByCategoryScreen extends StatelessWidget {
  final String categoryUrl;

  const ProductsByCategoryScreen({super.key, required this.categoryUrl});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(ProductApiService())
        ..add(FetchProductsByCategoryEvent(categoryUrl)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Products by category'),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductLoaded) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ListTile(
                    leading: Image.network(
                      product.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product.title),
                    subtitle: Text('\$${product.price}'),
                    onTap: () {
                      // Navigate to ProductDetailsScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsScreen(product: product),
                        ),
                      );
                    },
                  );
                },
              );
            } else if (state is ProductError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
