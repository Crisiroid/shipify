// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shipify/Model/Product.dart';

class CategoryView extends StatefulWidget {
  final String name;

  const CategoryView({super.key, required this.name});
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late Future<List<Product>> _allProducts;

  @override
  void initState() {
    super.initState();
    _allProducts = AllProducts(this.widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder(
            future: _allProducts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text("Data");
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
