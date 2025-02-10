import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/bloc/product_api_bloc.dart';
import 'package:test_task/models/product.dart';
import 'package:test_task/services/api_services.dart';
import 'package:test_task/widgets/product_container_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    // Trigger a rebuild when the search text changes
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) =>
          ProductBloc(ProductApiService())..add(FetchProductsEvent()),
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.03, horizontal: width * 0.02),
              child: Text(
                'Products',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: width * 0.8,
            child: TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search Products...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductLoaded) {
                  // Filter products based on search text
                  _filteredProducts = state.products
                      .where((product) => product.title
                          .toLowerCase()
                          .contains(_searchController.text.toLowerCase()))
                      .toList();

                  if (_filteredProducts.isEmpty) {
                    return Center(child: Text('No products found.'));
                  }

                  return ListView.builder(
                    itemCount: _filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = _filteredProducts[index];
                      return ProductContainerWidget(
                        imageSrc: product.image,
                        productTitle: product.title,
                        productPrice: product.price.toString(),
                        productRating: product.rating,
                      );
                    },
                  );
                } else if (state is ProductError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
                return Center(child: Text("No Products Available"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
