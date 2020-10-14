import 'package:flutter/material.dart';

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        centerTitle: true,
        title: Text(
        "Friends", textAlign: TextAlign.center,
    ),
        ),
    );
  }
}
