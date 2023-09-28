import 'package:flutter/material.dart';
import 'package:shipify/Model/Product.dart';

class ProductPage extends StatefulWidget {
  final int id;
  const ProductPage({super.key, required this.id});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late Future<Product> p;

  @override
  void initState() {
    super.initState();
    p = ShowProduct(this.widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
