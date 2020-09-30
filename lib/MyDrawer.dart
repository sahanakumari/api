import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';
import 'model/User.dart';

class MyDrawer extends StatefulWidget {
  User user;
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
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
                  ontap: () {},
                ),
                MenuOption(
                  label: 'Friends',
                  icon: Icons.people,
                  ontap: () {},
                ),
                MenuOption(
                  label: 'Profile',
                  icon: Icons.account_circle,
                  ontap: () {},
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
                    clearSharedPrefrences();
                    Navigator.of(context).pop();
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

  void clearSharedPrefrences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("Id");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext ctx) => Login()));
  }




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
