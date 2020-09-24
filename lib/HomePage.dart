import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:api/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  User user;
  HomePage({Key key, this.title,this.user}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
        title: InkWell(
          child:Center(
          child: Text("Posts",
          style: TextStyle(
           fontStyle: FontStyle.italic,),
        ),

        ),
        ),

          // actions: <Widget>[
          // new IconButton(
          //   icon: Icon(
          //     Icons.post_add_sharp,
          //     color: Colors.white,
          //   ),
          //   //padding: EdgeInsets.only(right:50,left:50),
          //   onPressed:(){},
          // ),
      //
          // ],

          ),






        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: <Widget>[
        //       Text("Welcome back " + widget.user.name + "!"),
        //       Text("Your Email is  " + widget.user.email),
        //       RaisedButton(
        //         onPressed: _handleLogout,
        //         child: Text("Logout"),
        //       )
        //     ],
        //   ),
    //    )

      drawer: new Drawer(
        child: new Column(
            children: <Widget>[
//            header
        new UserAccountsDrawerHeader(
        accountName: Text(widget.user.name ),
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

                label: 'Post',
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

                // ontap: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (contex) => new Cart()));
                //},

                ontap: (){},
              ),

                 Divider(),

        MenuOption(label: 'Log Out', ontap: (){}, icon: Icons.transit_enterexit, color: Colors.green,),


             

            ],

        ),

      ),
      ],

    ),


      ),

    );

  }
}

class MenuOption extends StatelessWidget {
  final String label;
  final void Function() ontap;
  final  IconData icon;
  final Color color;




  MenuOption({@required this.label, @required this.ontap, @required this.icon,this.color=Colors.blue});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        title: Text(label),
        leading: Icon(
          icon,
          color:color,
        ),
      ),
    );




  }
}
