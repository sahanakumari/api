import 'package:api/model/postfeed.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:api/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';
import 'Post.dart';
import 'main.dart';
import 'model/User.dart';


class MyDrawer extends StatefulWidget {
  final  User user;
  final postfeed post;
  final Address address;



  MyDrawer({this.user, this.address,  this.post,});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Storage stg=Storage();
  ///List<postfeed> post = new List();
  List<User> user = new List();
  List<Address> address = new List();




  @override
  Widget build(BuildContext context) {
    // print(' p userid ${widget.loginedUserId}');
    return Drawer(
      child: new Column(
        children: <Widget>[
//            header
          new UserAccountsDrawerHeader(
            accountName: Text(widget.user.name),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.person_outline,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: new BoxDecoration(color: Colors.red.shade900),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                MenuOption(
                  label: 'Post Feed',
                  icon: Icons.update,
                  ontap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (Context)=>Post(user: widget.user,post:widget.post)));
                  },
                ),
                MenuOption(
                  label: 'Friends',
                  icon: Icons.people,
                  ontap: () {},
                ),
                MenuOption(
                  label: 'Profile',
                  icon: Icons.account_circle,
                  ontap: () {
                    // if (widget.post.userId == widget.user.id)




                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (Context) => Profile(user: widget.user,address: widget.user.address, post: widget.post,)));
                  //  print('$user');
                  },
                ),
                Divider(
                  height: 150.0,
                  thickness: 0.5,
                  color: Colors.grey,
                ),
                MenuOption(
                  label: 'Log Out',
                  ontap: () {
                    logoutToast("Logged Out Successfuly");
                    stg.clearSavedUser();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Login()));
                  },
                  icon: Icons.transit_enterexit,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // void clearSharedPrefrences() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.remove("Id");
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (BuildContext ctx) => Login()));
  //   Navigator.pop(context);
  // }





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
