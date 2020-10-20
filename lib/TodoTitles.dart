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

class TodoTitles extends StatefulWidget {
  final User user;
  final postfeed post;
  final Todos todos;




  TodoTitles({this.user,this.todos,this.post});

  @override
  _TodoTitlesState createState() => _TodoTitlesState();
}

class _TodoTitlesState extends State<TodoTitles> {
  List<User> user = new List();
  List<postfeed> post = new List();
  List<Todos> todos = new List();
  int  loginedUserId;



  @override
  void initState() {
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
            "Todos",
            textAlign: TextAlign.center,
          ),

        actions: <Widget>[

         // Text("Update", textAlign: TextAlign.center, ),
              new IconButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>UpdateTodo(todos: widget.todos)));
              },
              icon: Icon(

                Icons.playlist_add_check,
                color: Colors.white,
                ))

        ],
      ),
      drawer: MyDrawer(user: widget.user),

      body: Column(
        children: <Widget>[
//          Text("Welcome back " + widget.user.name + "!"),
//          Text("Your Email is  " + widget.user.email)
          todos == null
              ? Container
              : Container(
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
                                '${todos[index].completed ? "✅" : "◻️"}    ${todos[index].title}')
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (Context)=>TodoScreen(todos: widget.todos,)));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blueAccent,
      ),
      resizeToAvoidBottomPadding: false,
    );
  }




  getTodoList() async {
    todos = await getTodo();
    setState(() {});
  }





}
