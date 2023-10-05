// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shipify/View/Decoration/Slides.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Column(children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            Slides(
                slideText: "hello world", imageUrl: "imageUrl", onTap: () {}),
            Slides(
                slideText: "hello world", imageUrl: "imageUrl", onTap: () {}),
            Slides(
                slideText: "hello world", imageUrl: "imageUrl", onTap: () {}),
          ]),
        )
      ]),
    ));
  }
}
