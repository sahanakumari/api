import 'package:api/MyDrawer.dart';
import 'package:flutter/material.dart';
import 'package:api/Post.dart';

import 'controller/post_controller.dart';
import 'model/postfeed.dart';

class NewPost extends StatefulWidget {
  final postfeed post;

  const NewPost({Key key, this.post}) : super(key: key);


  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {

  TextEditingController texttitlecontroller = new TextEditingController();
  TextEditingController textbodycontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
        title: Text(
        "New Post",
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
                  maxLines: 2, controller: texttitlecontroller,
                  textAlign: TextAlign.left,
                  //controller: titleController,
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    //labelText: constantStrings.additional_comments,
                      hintText: "Add your Title here",
                      labelStyle:
                      TextStyle(fontSize: 14.0, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 8.0),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 7, controller: textbodycontroller,
                  textAlign: TextAlign.left,
                  //controller: titleController,
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    //labelText: constantStrings.additional_comments,
                      hintText: "Add your Body here",
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
                                "submit",
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                             newPosts();
                               Navigator.pop(context,'Post()');
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


  newPosts() async
  {
    final isSuccess=
        await  newPost(widget.post,texttitlecontroller.text,textbodycontroller.text);
    print("$isSuccess");
    if (isSuccess) {
      logoutToast('Sucessfully new post posted');
    } else {
      logoutToast('Failed to Post... try again');
    }


  }

}
