import 'dart:convert';

import 'package:api/MyDrawer.dart';
import 'package:api/NewPost.dart';

import 'package:api/model/User.dart';
import 'package:api/model/postfeed.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Login.dart';
import 'SinglePostFeed.dart';
import 'controller/post_controller.dart';

class HomePage extends StatefulWidget {
  final User user;
  final postfeed post;


  HomePage({Key key, this.title, this.user,this.post}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  List<postfeed> post = new List();
  List<User> user = new List();

  int loginedUserId;
  bool _isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPostLists();
    getSharedUserValues();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Post Feeds",
            textAlign: TextAlign.center,
          )),
      drawer: MyDrawer(widget.user),

      body: Column(
        children: <Widget>[
//          Text("Welcome back " + widget.user.name + "!"),
//          Text("Your Email is  " + widget.user.email)
          post == null
              ? Container
              : Container(
//             height: 40.0,
            height: MediaQuery.of(context).size.height - 85,
            child: ListView.builder(
                itemCount: post.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0)),
                          color: getColorBasedOnUserPost(post, index),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              post[index].title,
                              style: TextStyle(fontSize: 16),
                            )),
                      ),
                    ),
                    onTap: () {
                      //  Navigator.push(context,MaterialPageRoute(builder: (context)=> new SinglePostFeed()));
                      print(post[index].userId);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SinglePostFeed(
                                 userloginid: loginedUserId,
                                user: widget.user,
                                post: post[index],
                           )),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (Context)=>NewPost()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  logoutToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  }

  getSharedUserValues() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int userId = preferences.getInt("Id");
    loginedUserId = userId;
    print('user id $userId');
  }

  Color getColorBasedOnUserPost(List<postfeed> post, int index) {
    if (post[index].userId == loginedUserId) {
      return Colors.lightBlueAccent;
    } else {
      ///friends post
      if (post[index].userId == loginedUserId - 1 ||
          post[index].userId == loginedUserId + 1) {
        return Colors.yellow;
      }
      else {
        return Colors.red;
        }
      }
    }
  getPostLists() async {
    print('users post called');
    post = await getPosts();
    setState(() {});
  }
}
