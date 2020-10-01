import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Login.dart';
import 'model/Comments.dart';
import 'model/User.dart';
import 'model/postfeed.dart';

class SinglePostFeed extends StatefulWidget {
  User user;
  postfeed post;
  int index;
  int userloginid;

  SinglePostFeed({Key key, this.user, this.post, this.userloginid})
      : super(key: key);

  @override
  _SinglePostFeedState createState() => _SinglePostFeedState();
}

class _SinglePostFeedState extends State<SinglePostFeed> {
  List<Comments> comments = new List();

  //get index => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Post",
            textAlign: TextAlign.center,
          ), //
          actions: <Widget>[
            new IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {},
            ),

//       drawer: new Drawer(
//         child: new Column(
//           children: <Widget>[
// //            header
//             new UserAccountsDrawerHeader(
//               accountName: Text(widget.user.name),
//               currentAccountPicture: GestureDetector(
//                 child: new CircleAvatar(
//                   backgroundColor: Colors.blue,
//                   child: Icon(
//                     Icons.person_outline,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               decoration: new BoxDecoration(color: Colors.red.shade900),
//             ),
//             Expanded(
//               child: ListView(
//                 children: <Widget>[
//                   MenuOption(
//                     label: 'Post Feed',
//                     icon: Icons.update,
//                     ontap: () {},
//                   ),
//                   MenuOption(
//                     label: 'Friends',
//                     icon: Icons.people,
//                     ontap: () {},
//                   ),
//                   MenuOption(
//                     label: 'Profile',
//                     icon: Icons.account_circle,
//                     ontap: () {},
//                   ),
//                   Divider(
//                     height: 150.0,
//                     thickness: 0.5,
//                     color: Colors.grey,
//                   ),
//                   MenuOption(
//                     label: 'Log Out',
//                     ontap: () {
//                       logoutToast("Logged Out Successfuly");
//                       clearSharedPrefrences();
//                       Navigator.of(context).pop();
//                     },
//                     icon: Icons.transit_enterexit,
//                     color: Colors.green,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//
          ]),
      body: widget.post != null
          ? Column(
              children: <Widget>[
                Text(widget.post.title),
                Text(widget.post.body),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      onPressed: () {},
                      child: Text('View user'),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Text('Comment'),
                    ),
                  ],
                ),
                Text('Comments'),
                comments.length > 0
                    ? Container(
                        padding: EdgeInsets.only(top: 20),
                        height: 400,
                        child: ListView.builder(
                            itemCount: comments.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color: Colors.black12),
                                    child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Text(
                                                comments[index].body,
                                                style: TextStyle(fontSize: 16),
                                              ),

                                              width: 200,

                                            ),
                                            // Row(mainAxisAlignment: MainAxisAlignment.start,
                                            //   children: [
                                            //     RaisedButton(onPressed: () {  },
                                            //       child: Text('View user'),),
                                            //     RaisedButton(onPressed: () {  },
                                            //       child: Text('Delete'),),
                                            //
                                            //
                                            //   ],),


                                            widget.userloginid ==
                                                    comments[index].id
                                                ? RaisedButton(
                                                    child: Text("delete"),
                                                  )
                                               : Container()
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
            )
          : Container(),
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
    print('users comment called');
    final response = await http.get("http://jsonplaceholder.typicode.com/comments?postId=${widget.post.id}",);
    final data = jsonDecode(response.body);
    print('ApI data $data');
    for (Map<String, dynamic> u in data) {
      Comments comm = Comments.fromJson(u);
      comments.add(comm);
    }
    setState(() {});
  }

  clearSharedPrefrences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("Id");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext ctx) => Login()));
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
