import 'dart:convert';

import 'package:api/SinglePostFeed.dart';
import 'package:api/TodoTitles.dart';
import 'package:api/UpdateTodo.dart';

import 'package:api/model/User.dart';
import 'package:api/model/postfeed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'controller/comments_controller.dart';
import 'controller/todo_controller.dart';
import 'model/Comments.dart';

import 'package:http/http.dart' as http;

import 'MyDrawer.dart';
import 'model/Todos.dart';

class TodoScreen extends StatefulWidget {
  final User user;
 final  Todos todos;
 final postfeed post;

  TodoScreen({
    this.todos,
    this.user,
    this.post,

  });

  @override
  _TodoScreen createState() => _TodoScreen();

}

class _TodoScreen extends State<TodoScreen> {
  List<User> user = new List();
  List<postfeed> post = new List();
  List<Todos> todos = new List();
  TextEditingController textEditingController = new TextEditingController();
  int  loginedUserId;

@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(
          title: Text(
            "Todos",
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
                      hintText: "Add your Todo  here",
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
                                newTodoList();

                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (Context) =>
                                            TodoTitles(user: widget.user,post: widget.post,todos: widget.todos)));
                              },
                            ),
                          )),
                    ],
                  )),
            ],
          ),
        ),
      resizeToAvoidBottomPadding: false,

    );
  }
  newTodoList() async
  {
    final isSuccess=
    await  newTodoPost(widget.todos,textEditingController.text);
    print("$isSuccess");
    if (isSuccess) {
      logoutToast('Sucessfully new Todo posted');
    } else {
      logoutToast('Failed to Post... try again');
    }


  }



}
