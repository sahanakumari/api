import 'dart:convert';
import 'dart:math';
import 'package:api/controller/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:api/Post.Feeddart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/post_controller.dart';
import 'main.dart';
import 'model/User.dart';
import 'model/postfeed.dart';

class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}



class _LoginState extends State<Login> {
  List<User> user = new List();
  String  password;
  int id;
  final _key = new GlobalKey<FormState>();
  bool _secureText = true;
  final myController = TextEditingController();
  List<User> users = [];
  Storage stg;
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    for(int i=0;i<users.length;i++){
      if(users[i].id.toString() == myController.text){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Post(user:users[i])));
        stg.saveUserLogin(users[i].id);
        loginToast("Logged In Successful");

      }
    }
  }


  login() async
  {
    print('users api called');
    final response = await http.get("https://jsonplaceholder.typicode.com/users",);
    final data = jsonDecode(response.body);
    print('ApI data $data');
    for (Map<String,dynamic> u in data){
      User user = User.fromJson(u);
      users.add(user);
    }
  }



  @override
  void initState() {
    // TODO: implement initState
    stg=Storage();
    super.initState();
    login();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 20.0,left: 5,right: 5),
          children: <Widget>[
            Center(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                //color: Colors.grey.withAlpha(20),
                color: Colors.lightBlueAccent,
                child: Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTac_Yg3Nd8jYV_bUBeY8Kn693jFpKapt1jfQ&usqp=CAU"),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 50,
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white, fontSize: 30.0,fontStyle: FontStyle.italic,),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),


                      Card(
                        elevation: 6.0,
                        child: TextFormField(controller: myController,
                          validator: (e) {
                            if (e.isEmpty) {
                              return "Please Enter User Id";
                            }
                          },

                          decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding:
                                EdgeInsets.only(left: 20, right: 15),
                                child:
                                Icon(Icons.person, color: Colors.black),
                              ),
                              contentPadding: EdgeInsets.all(20.0),
                              labelText: "User Id"),
                        ),
                      ),

                      // Card for password TextFormField
                      Card(
                        elevation: 6.0,
                        child: TextFormField(
                          validator: (value) {

                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            if (value.length < 3) {
                              return 'Must be more than 2 charater';
                            }
                          },
                          obscureText: _secureText,
                          onSaved: (e) => password = e,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 20, right: 15),
                              child: Icon(Icons.phonelink_lock,
                                  color: Colors.black),
                            ),
                            suffixIcon: IconButton(
                              onPressed: showHide,
                              icon: Icon(_secureText
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            contentPadding: EdgeInsets.all(20.0),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 12,
                      ),



                      Padding(
                        padding: EdgeInsets.all(35.0),
                      ),

                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                            height: 44.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(15.0)),
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 18.0),
                              ),
                              textColor: Colors.white,
                              padding: EdgeInsets.only(bottom:10.0),
                              color: Color(0xFFf7d426),
                              onPressed:  () {

                                check();

                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );




  }
 loginUser() async {
    user = await getUser();
    setState(() {});
  }

}




loginToast(String toast) {
  return Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white);
}


