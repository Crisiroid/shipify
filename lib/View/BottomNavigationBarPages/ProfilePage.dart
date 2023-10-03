// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            "Shipify",
            style: TextStyle(color: Colors.black, fontSize: 70),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 30,
            child: TextField(
              decoration: InputDecoration(hintText: "Username"),
            ),
          )
        ],
      ),
    );
  }
}
