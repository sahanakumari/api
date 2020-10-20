import 'dart:convert';

import 'package:api/MyDrawer.dart';
import 'package:api/NewPost.dart';
import 'package:api/TodoScreen.dart';
import 'package:api/UpdateTodo.dart';

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
import 'controller/todo_controller.dart';
import 'model/Todos.dart';

class CompletedTodo extends StatefulWidget {
  final User user;
  final postfeed post;
  final Todos todos;
  int userloginid;
  int  loginedUserId;



  CompletedTodo({this.user,this.todos,this.post,this.userloginid,this.loginedUserId});

  @override
  _CompletedTodoState createState() => _CompletedTodoState();
}

class _CompletedTodoState extends State<CompletedTodo> {
  List<Todos> todos;
  List<postfeed> post;
  List<User> user;
  int  loginedUserId;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodoList();
  }



  @override
  Widget build(BuildContext context) {
    print(' post page user${widget.user}');
    print('post page post ${widget.todos}');


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Todos Completed List",
          textAlign: TextAlign.center,
        ),


      ),
     // drawer: MyDrawer(user: widget.user,post:widget.post),

      body:                Column(
                    children: <Widget>[
//          Text("Welcome back " + widget.user.name + "!"),
//          Text("Your Email is  " + widget.user.email)
                      todos == null ? Container : Container(
//             height: 40.0,
                       height: MediaQuery.of(context).size.height - 85,
                        child: ListView.builder(
                            itemCount: todos.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 70,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),

                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                            '${todos[index].completed ? "✅" : "◻️"} [id: ${todos[index].id}] ${todos[index].title}')
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  //  Navigator.push(context,MaterialPageRoute(builder: (context)=> new SinglePostFeed()));
                                  print(todos[index].userId);

                                },
                              );
                            }),
                      ),
                    ],
                  ),

      resizeToAvoidBottomPadding: false,
    );
  }





  getTodoList() async {
    todos = await getTodo();
    setState(() {});
  }




}
