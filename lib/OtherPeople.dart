import 'package:flutter/material.dart';

import 'MyDrawer.dart';
import 'controller/post_controller.dart';
import 'controller/user_controller.dart';
import 'model/User.dart';
import 'model/postfeed.dart';

class OtherPeople extends StatefulWidget {
  final User user;
  final postfeed post;

  OtherPeople({Key key, this.user, this.post}) : super(key: key);

  @override
  _OtherPeopleState createState() => _OtherPeopleState();
}

class _OtherPeopleState extends State<OtherPeople> {
  List<postfeed> post;
  List<User> user;

  @override
  void initState() {
    post = new List();
    List<User> user = new List();
    super.initState();
    getPostLists();
    person();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Person",
              textAlign: TextAlign.center,
            )),
        drawer: MyDrawer(user: widget.user),
        body:SingleChildScrollView(child: Container(
            child: Column(children: <Widget>[
              widget.user == null
                  ? Container
                  : Container(
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('${widget.user.name}',
                          style: TextStyle(fontSize: 16),
                        )),

                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          widget.user.website,
                          style: TextStyle(fontSize: 16),
                        )),
                    Text('people Post'),
                    Column(
                      children: <Widget>[
                        post == null
                            ? Container
                            : Container(
                          height:
                          MediaQuery.of(context).size.height - 100,
                          child: ListView.builder(
                              itemCount: post.length,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return GestureDetector(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 160.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        // color: getColorBasedOnUserPost(post, index),
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            post[index].title,
                                            style:
                                            TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            post[index].body,
                                            style:
                                            TextStyle(fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {},
                                );
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

        ]
    )
                )
        )


    );
  }

  getPostLists() async {
    print('users post called');
    List<postfeed> allpost = await getPosts();
    for(int i=0;i<allpost.length;i++){
      if(allpost[i].userId == widget.user.id){
        post.add(allpost[i]);
      }
    }
    setState(() {});
  }

  person() async {
    List<User> alluser= await getUser();
    for(int i=0;i<alluser.length;i++){
      if(alluser[i].id== widget.post.userId){
        user.add(alluser[i]);
      }
    }
    setState(() {});
  }
}
