import 'dart:convert';

import 'package:api/SinglePostFeed.dart';

import 'package:api/model/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'controller/comments_controller.dart';
import 'model/Comments.dart';

import 'package:http/http.dart' as http;

import 'MyDrawer.dart';

class CommentScreen extends StatefulWidget {
  final User user;
  Comments comm;
  CommentScreen({
    this.comm,
    this.user,
  });

  @override
  _CommentScreen createState() => _CommentScreen();
}

class _CommentScreen extends State<CommentScreen> {
  TextEditingController textEditingController = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(
          title: Text(
            "Comments",
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 8.0),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 7, controller: textEditingController,
                  textAlign: TextAlign.left,
                  //controller: titleController,
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    //labelText: constantStrings.additional_comments,
                      hintText: "Add your comment here",
                      labelStyle:
                      TextStyle(fontSize: 14.0, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 19.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Material(
                        //Wrap with Material
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          color: Colors.blueAccent[700],
                          clipBehavior: Clip.antiAlias, // Add This
                          child: SizedBox(
                            height: 50,
                            child: MaterialButton(
                              minWidth: 200.0,
                              child: new Text(
                                "submit",
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                postComments();
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (Context) =>
                                            SinglePostFeed()));
                              },
                            ),
                          )),
                    ],
                  )),
            ],
          ),
        )
    );
  }

  //   postComments() async {
  //     final response = await http.post("http://jsonplaceholder.typicode.com/comments/");
  //     if(response.statusCode == 201){
  //       logoutToast('Sucessfully Commented');
  //     }else{
  //       logoutToast('Failed to comment... try again');
  //     }
  // }
  //postComments() async {

  // Future<List<Comments>> postComments() async {
  //   final response = await http.post("http://jsonplaceholder.typicode.com/comments/");
  //
  //   if (response.statusCode == 201) {
  //     List<dynamic> body = jsonDecode(response.body);
  //
  //     List<Comments> comms = body
  //         .map(
  //           (dynamic item) => Comments.fromJson(item),
  //     )
  //         .toList();
  //
  //     return comms;
  //   } else {
  //     throw "Can't  posts comments.";
  //   }
  // }
  postComments() async {
    //   Map data = {
    //  // "postId": 1,users[i].id.toString()
    //   "id":'${widget.user.id}',
    //   "name": '${widget.user.name}',
    //   "email": '${widget.user.email}',
    //   "body": textEditingController.text
    //   };

    //   String body = json.encode(data);
    //   http.Response response = await http.post(
    //     'http://jsonplaceholder.typicode.com/comments/',
    //     headers: {"Content-Type": "application/json"},
    //     body: body,);
    final isSuccess =
    await postComment(widget.user, textEditingController.text);
    if (isSuccess) {
      logoutToast('Sucessfully Commented');
    } else {
      logoutToast('Failed to comment... try again');
    }
  }
}
