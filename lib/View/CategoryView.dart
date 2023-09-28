// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shipify/Model/Product.dart';
import 'package:shipify/View/ProductPage.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              "Shipify ",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: _allProducts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductPage(id: snapshot.data![index].id))),
                      child: Card(
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: Container(
                            margin: EdgeInsets.all(10),
                            child: ListTile(
                              title:
                                  Text(snapshot.data![index].title.toString()),
                              leading:
                                  Image.network(snapshot.data![index].image),
                            )),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
