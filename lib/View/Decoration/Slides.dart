import 'package:flutter/material.dart';

class Slides extends StatelessWidget {
  final String slideText;
  final String imageUrl;
  final VoidCallback onTap;
  const Slides(
      {super.key,
      required this.slideText,
      required this.imageUrl,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width - 40,
      height: 250,
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 250,
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.black.withAlpha(0),
                  Colors.black12,
                  Colors.black45
                ],
              ),
            ),
            child: Text(
              slideText,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
