import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_task/models/category.dart';
import 'package:test_task/models/product.dart';

extension APIExtension on http.Response {
  bool get isSuccess => statusCode == 200;
}

abstract class ApiServices {
  String get baseUrl => 'https://dummyjson.com';
  String get apiUrl;
  String get completeUrl => baseUrl + apiUrl;

  Future<dynamic> fetch({String endpoint = ''}) async {
    var response = await http.get(Uri.parse(completeUrl + endpoint));
    if (response.isSuccess) {
      return jsonDecode(response.body);
    }
    return null;
  }
}

class ProductApiService extends ApiServices {
  @override
  String get apiUrl => '/products';

  Future<List<Product>> fetchProducts() async {
    var response = await fetch();
    print(response);
    if (response != null && response.containsKey('products')) {
      List<dynamic> products = response['products'];
      return products.map((productMap) => Product.fromMap(productMap)).toList();
    }
    return [];
  }

  Future<Map<String, dynamic>> fetchProduct(int id) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/$id'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      throw Exception('Error fetching product: $e');
    }
  }

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((categoryJson) => Category.fromJson(categoryJson))
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<Product>> fetchProductsByCategory(String categoryUrl) async {
    final response = await http.get(Uri.parse(categoryUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> productsJson = data['products'];
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
