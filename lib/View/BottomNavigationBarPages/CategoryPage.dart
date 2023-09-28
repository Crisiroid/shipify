// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shipify/View/CategoryView.dart';
import 'package:shipify/View/Decoration/CategoryBox.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryBox(
                  name: "Electronics",
                  color: Color.fromARGB(255, 190, 190, 190),
                  icon: Icon(
                    Icons.phone_android_outlined,
                    size: 90,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CategoryView(name: "electronics")));
                  }),
              const SizedBox(width: 20),
              CategoryBox(
                  name: "Jewelery",
                  color: Color.fromARGB(255, 175, 175, 175),
                  icon: Icon(
                    Icons.air,
                    size: 90,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CategoryView(name: "jewelery")));
                  })
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryBox(
                  name: "Shirt",
                  color: Color.fromARGB(255, 175, 175, 175),
                  icon: Icon(
                    Icons.man_2,
                    size: 90,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CategoryView(name: "men's clothing")));
                  }),
              const SizedBox(width: 20),
              CategoryBox(
                  name: "Dress",
                  color: Color.fromARGB(255, 190, 190, 190),
                  icon: Icon(
                    Icons.woman_outlined,
                    size: 90,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CategoryView(name: "women's clothing")));
                  })
            ],
          ),
        ],
      ),
    );
  }
}
