import 'dart:convert';

import 'package:api/MyDrawer.dart';
import 'package:api/model/User.dart';
import 'package:api/model/postfeed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Login.dart';
import 'SinglePostFeed.dart';

class HomePage extends StatefulWidget {
  final User user;

  HomePage({Key key, this.title, this.user}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  List<postfeed> post = new List();
  int loginedUserId;

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
//       ),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SinglePostFeed(userloginid: loginedUserId,post:post[index])),);

                          },
                        );
                      }),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
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
      return Colors.greenAccent;
    } else {
      ///friends post
      if (post[index].userId == loginedUserId - 1 ||
          post[index].userId == loginedUserId + 1) {
        return Colors.blue;
      } else {
        ///remaing people
        return Colors.red;
      }
    }
  }

  getPostLists() async {
    print('users post called');
    final response = await http.get(
      "https://jsonplaceholder.typicode.com/posts",
    );
    final data = jsonDecode(response.body);
    print('ApI data $data');
    for (Map<String, dynamic> u in data) {
      postfeed posts = postfeed.fromJson(u);
      post.add(posts);
    }
    setState(() {});
  }

  void clearSharedPrefrences() async {
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
