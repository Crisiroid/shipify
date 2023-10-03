// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 170,
          ),
          Text(
            "Shipify",
            style: TextStyle(color: Colors.black, fontSize: 70),
          ),
          const SizedBox(height: 30),
          Container(
            width: MediaQuery.of(context).size.width - 30,
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: "Username",
                filled: true,
                fillColor: Color.fromARGB(255, 227, 225, 225),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: MediaQuery.of(context).size.width - 30,
            child: TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                filled: true,
                fillColor: Color.fromARGB(255, 227, 225, 225),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
