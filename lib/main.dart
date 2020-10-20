import 'dart:convert';

import 'package:api/SinglePostFeed.dart';
import 'package:api/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:api/Post.Feeddart';
import 'package:api/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/User.dart';
import 'model/postfeed.dart';
import 'package:http/http.dart' as http;

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  Storage s=Storage();
  List<User> users=[];
  List<postfeed> post = new List();
  post=await getPosts();

  final response = await http.get("https://jsonplaceholder.typicode.com/users",);
  final data = jsonDecode(response.body);
  for (Map<String,dynamic> u in data)
  {
    User user = User.fromJson(u);
    users.add(user);
  }
  int id=await s.getSaveUserId();
 // print("Id is : $id  length user ${users.length} length of post ${post.length} ");

  runApp(MaterialApp
    (debugShowCheckedModeBanner: false,
      home:id==null && users.length>0?Login():Post(user:users[id])
     )
  );
}



class Storage
{
  saveUserLogin(int id) async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("Id",id);
  }

  Future<int> getSaveUserId() async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int id=preferences.getInt("Id");
    return id;
  }


  clearSavedUser() async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("Id");
    preferences.clear();
  }
}

