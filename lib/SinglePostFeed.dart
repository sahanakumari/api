import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CommentScreen.dart';
import 'FriendsProfile.dart';
import 'Login.dart';
import 'MyDrawer.dart';
import 'OtherPeople.dart';
import 'Profile.dart';
import 'controller/comments_controller.dart';

import 'controller/post_controller.dart';
import 'model/Comments.dart';
import 'model/User.dart';
import 'model/postfeed.dart';

class SinglePostFeed extends StatefulWidget {
  final User user;
  final Comments comments;
  final Address address;
  var colorex;

  SinglePostFeed({
    this.user,
    this.comments,
    this.address,
    this.post,
    this.index,
    this.colorex
  });

  final postfeed post;
  int index;
  int userloginid;
  int loginedUserId;

  // SinglePostFeed({Key key, this.user, this.post, this.userloginid,this.loginedUserId,this.comments,this.address})
  //     : super(key: key);

  @override
  _SinglePostFeedState createState() => _SinglePostFeedState();
}

class _SinglePostFeedState extends State<SinglePostFeed> {
  List<Comments> comments = new List();
  List<postfeed> post = new List();
  List<User> user = new List();
  List<Address> address = new List();
  int loginedUserId;
  int index;
  bool _hideVisible = false;


  bool _isDeleteMode = false;

  void hidedelete() {
    setState(() {
      if (widget.post.userId == widget.user.id) _isDeleteMode = !_isDeleteMode;
    });
  }

  void hideText() {
    setState(() {
      if (widget.post.userId == widget.user.id - 1 ||
          widget.post.userId == widget.user.id + 1)
        _hideVisible = !_hideVisible;
    });
  }

  @override
  void initState() {
    print(' post userId ${widget.post.userId}');
    print('user ${widget.userloginid}');
    print('user ${widget.user.id}');
    print('post ${widget.post.id}');
    print('color ${widget.colorex}');
    super.initState();
    getComments();
    hidedelete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Post", textAlign: TextAlign.center,
        ),

        //       actions: <Widget>[
        //   _isDeleteMode ? IconButton(
        //   onPressed: () {},
        //     icon: Icon(Icons.delete)
        // )
        // ]
        //           : Container(),
        // ),
        actions: <Widget>[
          _isDeleteMode
              ? new IconButton(
                  onPressed: () {
                    delete();
                    if (widget.post.userId == widget.user.id) {
                      logoutToast("Successfully post deleted...!");
                    } else {
                      logoutToast("You cant delete others post...!");
                    }
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ))
              : Container(),
        ],
      ),
      drawer: MyDrawer(user: widget.user, post: widget.post),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Text(widget.post.title),
          Text(widget.post.body),
          // Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                 children: [
          //                   Column(children: [
          //                     RaisedButton(
          //                       onPressed: () {
          //                         print(widget.post.userId);
          //                         showUserName = !showUserName;
          //                       },
          //                       child: Text('View user'),
          //                     ),
          //                     Visibility(visible: showUserName,
          //                         //  Text("Your Email is  " + widget.user.email)
          //                         child: Text('${widget.post.userId }' + " is the user  ")),
          //
          //                   ],),
          //                   RaisedButton(
          //                     onPressed: () {},
          //                     child: Text('Comment'),
          //                   ),
          //                 ],
          // ),

          Row(
            children: <Widget>[
              // Expanded(
              //     child: MaterialButton(
              //       child: Text(
              //         "view user",
              //       ),
              //       onPressed: () {
              //         showDialog(
              //             context: context,
              //             builder: (context) {
              //               return AlertDialog(
              //                 title: Text("View User"),
              //                 content: Text('${widget.user.name }' + " is the user  "),
              //                // content:
              //                 // Text('${widget.post.id}' + " is the user  "),
              //                 // actions: <Widget>[
              //                 //   MaterialButton(
              //                 //     onPressed: () {
              //                 //       Navigator.of(context).pop(context);
              //                 //     },
              //                 //     child: Text("Close"),
              //                 //   )
              //                // ],
              //
              //               );
              //             });
              //       },
              //       color: Colors.white,
              //       textColor: Colors.black,
              //       elevation: 0.2,
              //     )),
              // _hideVisible ?
              Visibility(
                visible: widget.colorex==Colors.lightBlueAccent?false:true,
                child:
              Expanded(
                  child:MaterialButton(
                child: Text("View User"),
                onPressed: () {
                  // if (widget.post.userId == widget.user.id- 1 ||
                  //     widget.post.userId == widget.user.id+ 1) {
                  getColorBasedOnUserPost(post, index);
                  _hideVisible;

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (Context) => FriendsProfile(
                                user: widget.user,
                                address: widget.user.address,
                                post: widget.post,
                                userloginid: loginedUserId,
                              )));
                  print('$user');
                },
              ))),

              Expanded(
                  child: MaterialButton(
                child: Text(" Click here to Comment"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (Context) => CommentScreen(
                                user: widget.user,
                              )));
                },
              )),
            ],
          ),

          Text('Comments'),
          comments.length > 0
              ? Container(
                  padding: EdgeInsets.only(top: 20),
                  height: 399.0,
                  child: ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 110,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Colors.black12),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Container(
                                          height: 60,
                                          child: Center(
                                            child: Text(
                                              comments[index].body,
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          )),
                                    ),

                                    // Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    //   children: [
                                    //     RaisedButton(onPressed: () {  },
                                    //       child: Text('user'),),
                                    //     RaisedButton(onPressed: () {
                                    //       deleteComments();
                                    //     },
                                    //       child: Text('Delete'),),
                                    //   ],),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {},
                        );
                      }),
                )
              : Container()
        ],
      )),
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

  getComments() async {
    // print('users comment called');
    // final response = await http.get(
    //   "http://jsonplaceholder.typicode.com/comments?postId=${widget.post.id}",
    // );
    // final data = jsonDecode(response.body);
    // print('ApI data $data');
    // for (Map<String, dynamic> u in data) {
    //   Comments comm = Comments.fromJson(u);
    //   comments.add(comm);
    // }
    // comments = await getCommentsOfPost(widget.post);
    comments = await getCommentsOfPost(widget.post);
    setState(() {});
  }

  delete() async {
    // final response = await http.delete(
    //   "https://jsonplaceholder.typicode.com/posts/postId=${widget.post.id}",
    // );
    // final data = jsonDecode(response.body);
    // print('ApI data $data');
    // if (response.statusCode == 200) {
    //  return true;
    // } else {
    //   return false;
    // }
    // post = (await deleteUserPosts(widget.post)).cast<postfeed>();
    //  post = await deleteUserPosts(widget.post);
    // post= await deleteUserPosts(widget.post);
    setState(() {});
  }

  clearSharedPrefrences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("Id");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext ctx) => Login()));
  }

  Color getColorBasedOnUserPost(List<postfeed> post, int index) {
    ///friends post
    if (post[index].userId == loginedUserId - 1 ||
        post[index].userId == loginedUserId + 1) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }
}

class MenuOption extends StatelessWidget {
  final String label;
  final void Function() ontap;
  final IconData icon;
  final Color color;

  MenuOption(
      {@required this.label,
      @required this.ontap,
      @required this.icon,
      this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        title: Text(label),
        leading: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
