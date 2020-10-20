import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MyDrawer.dart';
import 'model/User.dart';
import 'model/postfeed.dart';

class Friends extends StatefulWidget {
  final postfeed post;
  final User user;
  int userloginid;
  int  loginedUserId;

 Friends({Key key, this.post, this.user, this.userloginid,this.loginedUserId}) : super(key: key);

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  int  loginedUserId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Friends",
              textAlign: TextAlign.center,
            )),
        drawer: MyDrawer(user: widget.user),
        body: new Container(
            color: Colors.white,
            child: new ListView(children: <Widget>[
              Expanded(
                  child: new Column(children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 20.0),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 110.0),
                          child: new Text('Friends',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  fontFamily: 'sans-serif-light',
                                  color: Colors.black)),
                        )
                      ],
                    )),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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


                              Divider(),
                              Padding(
                                  padding: EdgeInsets.only(left: 20.0, top: 20.0),
                                  child: new Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 110.0),
                                        child: new Text('People',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                                fontFamily: 'sans-serif-light',
                                                color: Colors.black)),
                                      )
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
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
              ]
                        ),




    )
    )
                    ])
                )
            ]
                )

    )


    );
  }


}
