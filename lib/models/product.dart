// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  final int id;
  final String title;
  final String image;
  final double price;
  final String description;
  final double rating;
  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.rating,
  });

  Product copyWith({
    int? id,
    String? name,
    String? image,
    double? price,
    String? description,
    double? rating,
  }) {
    return Product(
      id: id ?? this.id,
      title: name ?? title,
      image: image ?? this.image,
      price: price ?? this.price,
      description: description ?? this.description,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'image': image,
      'price': price,
      'description': description,
      'rating': rating,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? 0,
      title: map['title'] ?? 'no title',
      image: (map['images'] != null && (map['images'] as List).isNotEmpty)
          ? map['images'][0]
          : 'No URL',
      price: map['price'] ?? 0.0,
      description: map['description'],
      rating: map['rating']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, name: $title, image: $image, price: $price, rating: $rating)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.image == image &&
        other.price == price &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        image.hashCode ^
        price.hashCode ^
        rating.hashCode;
  }
}
