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
    p = ShowProduct(widget.id);
  }

  Widget buildRatingStars(int ratingCount) {
    List<Widget> stars = [];

    for (int i = 0; i < ratingCount; i++) {
      stars.add(Icon(Icons.star, color: Colors.yellow));
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: stars);
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
            const Text(
              "Shipify",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            child: FutureBuilder(
              future: p,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(snapshot.data!.image),
                      const SizedBox(height: 20),
                      Center(
                          child: Text(
                        snapshot.data!.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                      const SizedBox(height: 10),
                      Text(snapshot.data!.description),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Text("Price:  "),
                          Text(
                            snapshot.data!.price.toString() + "\$",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )
                        ],
                      ),
                      const Text(
                        "Ratings:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Center(
                          child: buildRatingStars(
                              snapshot.data!.rating.rate.toInt())),
                      Container(
                        width: MediaQuery.of(context).size.width - 10,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Add to Cart"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                        ),
                      )
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
