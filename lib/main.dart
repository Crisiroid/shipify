import 'package:flutter/material.dart';
import 'package:shipify/View/Home.dart';

void main() {
  runApp(Shipify());
}

class Shipify extends StatelessWidget {
  const Shipify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shipify - A new Online store!",
      home: HomeView(),
    );
  }
}
