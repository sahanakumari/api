import 'package:api/model/postfeed.dart';
import 'package:flutter/material.dart';

import 'FriendsProfile.dart';
import 'MyDrawer.dart';
import 'OtherPeople.dart';
import 'controller/post_controller.dart';
import 'model/User.dart';
import 'model/User.dart';


class Profile extends StatefulWidget {

   final postfeed post;
  final User user;
final Address address;
   int userloginid;
   int  loginedUserId;


  Profile({this.user,this.address,this.post,this.userloginid,this.loginedUserId});

  @override
  _ProfileState createState() => _ProfileState();

}

class _ProfileState extends State<Profile> {

  List<User> user = new List();
  List<postfeed> post = new List();
  int loginedUserId;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profile();
    getPostLists();

    print('${widget.post.userId}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Profile",
            textAlign: TextAlign.center,
          )),
      drawer: MyDrawer(widget.user),
      //     body: Card(
      //       child: ListView(
      //         children: <Widget>[
      //            Text(widget.user.name),
      //         ]
      //     ),
      // )
      body: new Container(
        color: Colors.white,

        child: new ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                new Container(
                  height: 250.0,
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 20.0, top: 20.0),
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Padding(
                                padding: EdgeInsets.only(left: 110.0),
                                child: new Text(
                                    'PROFILE', textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        fontFamily: 'sans-serif-light',
                                        color: Colors.black)),
                              )
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 95.0,),
                        child: new Stack(
                            fit: StackFit.loose, children: <Widget>[
                          new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                  width: 60.0,
                                  height: 66.0,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,

                                  )),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 90.0, right: 100.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 25.0,
                                    child: new Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              )),
                        ]),
                      )
                    ],
                  ),
                ),
                new Container(
                  color: Color(0xffFFFFFF),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      'Personal Information',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                // new Column(
                                //   mainAxisAlignment: MainAxisAlignment.end,
                                //   mainAxisSize: MainAxisSize.min,
                                //   children: <Widget>[
                                //     _status ? _getEditIcon() : new Container(),
                                //   ],
                                // )
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      'Name',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: Text(widget.user.name),
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      'Email ID',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: Text(widget.user.email),
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      'Mobile',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: Text(widget.user.phone),
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: new Text(
                                      'Address',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: Container(
                                    child: new Text(
                                      'City',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  flex: 2,
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                right: 10.0, top: 2.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 55.0, top: 2.0),
                                    child: Text(widget.address.street),
                                  ),
                                  flex: 2,
                                ),
                                Flexible(
                                  child: Text(widget.address.city),
                                  flex: 2,
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

            Row(
              children: <Widget>[

                Expanded(

                    child: MaterialButton(
                      onPressed: () {

                      },
                      color: Colors.white,
                      textColor: Colors.black,
                      padding: EdgeInsets.only(left: 25.0,),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text("Friends")),
                          Expanded(child: Icon(Icons.people)),
                        ],
                      ),
                    )),
                Expanded(

                    child: MaterialButton(
                      onPressed: () {

                      },
                      color: Colors.white,
                      textColor: Colors.black,
                      padding: EdgeInsets.only(left: 23.0,),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text("Albums")),
                          Expanded(child: Icon(Icons.photo_album)),
                        ],
                      ),
                    )),
                Expanded(

                    child: MaterialButton(
                      onPressed: () {

                      },
                      color: Colors.white,
                      textColor: Colors.black,
                      padding: EdgeInsets.only(left: 25.0,),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text("Todo")),
                          Expanded(child: Icon(Icons.playlist_add_check)),
                        ],
                      ),
                    )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(

                      child: Text(" User Posts",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.blue, fontSize: 19.0
                        ),
                      ),
                    )

                )
              ],
            ),
            Column(
              children: <Widget>[
//          Text("Welcome back " + widget.user.name + "!"),
//          Text("Your Email is  " + widget.user.email)
                post == null
                    ? Container
                    : Container(
//             height: 40.0,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height - 150,
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 85.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                                color: getColorBasedOnUserPost(post, index),
                              ),

                              child: Column(
                                children: <Widget>[

                                  Expanded(child: Text(
                                    post[index].title,
                                    style: TextStyle(fontSize: 16),
                                  )),
                                  Expanded(child: Text(
                                    post[index].body,
                                    style: TextStyle(fontSize: 16),
                                  )),
                                ],
                              ),

                            ),
                          ),
                          onTap: () {


                          },
                        );
                      }),
                ),
              ],
            ),
          ],

        ),

      ),


    );
  }


  profile() async {
    user = await getUser();
    setState(() {});
  }

  getPostLists() async {
    print('users post called');
    post = await getPosts();

    setState(() {});
  }

  Color getColorBasedOnUserPost(List<postfeed> post, int index) {
    if (widget.post.userId == widget.user.id) {
      return Colors.lightBlueAccent;
    }
    else {
      ///friends post
      if (widget.post.userId == widget.user.id - 1 ||
          widget.post.userId == widget.user.id + 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (Context) => FriendsProfile()));

        return Colors.yellow;
      }
      else {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (Context) => OtherPeople()));
        return Colors.red;
      }
    }
  }
}

