import 'dart:convert';

import 'package:api/SinglePostFeed.dart';
import 'package:flutter/material.dart';
import 'model/Comments.dart';

import 'package:http/http.dart' as http;

import 'MyDrawer.dart';



class CommentScreen extends StatefulWidget {
  // int userloginid;
  // postfeed post;

  Comments comm;



  CommentScreen({this.comm});

  @override
  _CommentScreen createState() => _CommentScreen();
}

class _CommentScreen extends State<CommentScreen> {




  // Future<CommentScreen> createComments(String name) async{
  //   final String apiUrl = "http://jsonplaceholder.typicode.com/comments/";
  //
  //   final response = await http.post(apiUrl, body: {
  //     "name": name,
  //
  //   });
  //
  //   if(response.statusCode == 201){
  //     logoutToast('Sucessfully Commented');
  //   }else{
  //     logoutToast('Failed to comment... try again');
  //   }
  // }



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
                  maxLines: 7,
                  textAlign: TextAlign.left,
                  //controller: titleController,
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    //labelText: constantStrings.additional_comments,
                      hintText: "Add your comment here",
                      labelStyle:
                      TextStyle(fontSize: 18.0, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),

              Padding(
                  padding: EdgeInsets.only(top: 20.0),
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
                            height: 45,
                            child: MaterialButton(
                              minWidth: 200.0,
                              child: new Text(
                                "submit",
                                style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),),
                              onPressed: () {
                               postComments();
                                Navigator.pop(context, MaterialPageRoute(
                                    builder: (Context) => SinglePostFeed()));
                              },
                            ),
                          )
                      ),

                    ],
                  )),

            ],
          ),
        ));
  }


    postComments() async {
      final response = await http.post("http://jsonplaceholder.typicode.com/comments/");
      if(response.statusCode == 201){
        logoutToast('Sucessfully Commented');
      }else{
        logoutToast('Failed to comment... try again');
      }
  }
  // postComments() async {
  //   Map data = {
  //   "postId": 1,
  //   "id": 1,
  //   "name": "id labore ex et quam laborum",
  //   "email": "Eliseo@gardner.biz",
  //   "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos"};
  //
  //   String body = json.encode(data);
  //
  //   http.Response response = await http.post(
  //     'http://jsonplaceholder.typicode.com/comments/',
  //     headers: {"Content-Type": "application/json"},
  //     body: body,
  //       if(response.statusCode == 201)
  //       {
  //       logoutToast('Sucessfully Commented');
  //     }
  //       else
  //         {
  //       logoutToast('Failed to comment... try again');
  //     }
  //   }
  //
  // //   http.Response response = await http.post(
  // //     url:'http://jsonplaceholder.typicode.com/comments/',
  // //     headers: {"Content-Type": "application/json"},
  // //     body: body);
  // // }

}
