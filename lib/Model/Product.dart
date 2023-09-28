import 'dart:convert';

import 'package:shipify/Model/Rating.dart';
import 'package:http/http.dart' as http;

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    double price =
        0.0; // Default value in case 'price' cannot be parsed as double

    try {
      price = (json['price'] as num)
          .toDouble(); // Attempt to parse 'price' as a double
    } catch (e) {
      // Handle the exception if parsing 'price' as a double fails
      print("Error parsing 'price': $e");
    }

    return Product(
      id: json['id'],
      title: json['title'],
      price: price,
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: Rating.fromJson(json['rating']),
    );
  }
}

Future<List<Product>> AllProducts(String name) async {
  List<Product> list = [];
  final res = await http
      .get(Uri.parse("https://fakestoreapi.com/products/category/${name}"));

  if (res.statusCode == 200) {
    for (final product in jsonDecode(res.body)) {
      list.add(Product.fromJson(product));
    }
  } else {
    throw Exception(res.body);
  }

  return list;
}

// ignore: non_constant_identifier_names
Future<Product> ShowProduct(int id) async {
  final res =
      await http.get(Uri.parse("https://fakestoreapi.com/products/${id}"));

  if (res.statusCode == 200) {
    return Product.fromJson(jsonDecode(res.body));
  } else {
    throw Exception(res.body);
  }
}
