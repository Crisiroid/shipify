// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shipify/Model/Product.dart';
import 'package:shipify/View/Decoration/Slides.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Product>> _productList;

  @override
  void initState() {
    super.initState();
    _productList = ShowProductsLimited(7);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Column(children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            Slides(
              slideText: "First Slide",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png",
              onTap: () {},
            ),
            Slides(
              slideText: "Second Slide",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png",
              onTap: () {},
            ),
            Slides(
              slideText: "Third Slide",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png",
              onTap: () {},
            ),
          ]),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
              margin: EdgeInsets.only(top: 30),
              color: Colors.red,
              height: 300,
              child: Row(
                children: [
                  Text(
                    "Futured Products:",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  FutureBuilder(
                    future: _productList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text("Hello world");
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }

                      return CircularProgressIndicator();
                    },
                  ),
                ],
              )),
        )
      ]),
    ));
  }
}
