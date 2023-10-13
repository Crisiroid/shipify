import 'package:flutter/material.dart';
import 'package:shipify/Model/Product.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Product> products;
  bool hasProduct = false;
  @override
  void initState() {
    super.initState();
    if (products.isEmpty) {
      hasProduct = false;
    } else {
      hasProduct = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 196, 196, 196),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text("Hello ${index}"),
            );
          }),
    );
  }
}
