import 'dart:convert';

import 'package:api/SinglePostFeed.dart';
import 'package:api/TodoTitles.dart';

import 'package:api/model/User.dart';
import 'package:api/model/postfeed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CompletedTodo.dart';
import 'controller/comments_controller.dart';
import 'controller/todo_controller.dart';
import 'model/Comments.dart';

import 'package:http/http.dart' as http;

import 'MyDrawer.dart';
import 'model/Todos.dart';

class UpdateTodo extends StatefulWidget {

  final Todos todos;




   UpdateTodo({Key key,  this.todos }) : super(key: key);


  @override
  _UpdateTodo  createState() => _UpdateTodo ();
}

class _UpdateTodo  extends State<UpdateTodo > {
 // final key = new GlobalKey<FormState>();

  List<postfeed> post = new List();
  List<Todos> todos = new List();
  int  loginedUserId;
  bool _iscompleted = true;


  TextEditingController textEditingController = new TextEditingController();


  
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodoList();

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

          actions: <Widget>[

            new IconButton(
                onPressed: () {


                  print('todos userId${widget.todos.completed}');
                   if(widget.todos.completed)
                   getTodoList();
                Navigator.push(context,MaterialPageRoute(builder: (context)=>CompletedTodo(todos: widget.todos)));


                },
                icon: Icon(
                  Icons.mark_chat_read_rounded,
                  color: Colors.white,
                )),




            new IconButton(


                onPressed: () {

                  //if (widget.post.id == widget.user.id)
                  //   if (widget.todos.userId == widget.user.id)
                  // {
                  //   logoutToast("Successfully Todo deleted...!");
                  // } else {
                  //   logoutToast("try again Todo not deleted...!");
                  // }

                  delete();
                  Column(
                    children: <Widget>[
//          Text("Welcome back " + widget.user.name + "!"),
//          Text("Your Email is  " + widget.user.email)

                      Container(
//             height: 40.0,
                        height: MediaQuery.of(context).size.height - 85,
                        child: ListView.builder(
                            itemCount: todos.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Dismissible(
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
                                          // '${todos[index].completed ? "✅" : "◻️"}    ${todos[index].title}')
                                            ' ${todos[index].completed ? "✅" : "◻️"} [id: ${todos[index].id}] ${todos[index].title}'),
                                   //      key: ValueKey(todos);
                                   // direction: DismissDirection.endToStart,
                                   //  background: Container(
                                   //    color: Colors.red,
                                   //    child: Icon(Icons.delete, color: Colors.white),
                                   //
                                   //  ),

                                  ),
                                ),
                              ),

                              );

                            }),
                      ),
                    ],
                  );


                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                )
            )


          ],
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
                      hintText: "Update Todo here",
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
                                "update",
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                updateTodo(widget.todos.id);
                                Navigator.of(context).pop();
                                      // Navigator.pop(context,TodoTitles(todos: widget.todos));
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

  delete() async
  {
    print('todos id ${widget.todos.userId}');
   todos = (await deleteTodoPosts()) as List<Todos>;
    setState(() {});

  }






  updateTodo(int id) async
  {

    final isSuccess=
    await  newUpdateTodo(widget.todos,textEditingController.text);
    print("$isSuccess");
    if (isSuccess) {
      logoutToast('Sucessfully new Todo Updated');
    } else {
      logoutToast('Failed to Update... try again');
    }

    setState(() {});
  }


  getTodoList() async {
  print('todos userId${widget.todos.userId}');
  print('todos userId${widget.todos.id}');
    todos = await getTodo();
    setState(() {});
  }



}
