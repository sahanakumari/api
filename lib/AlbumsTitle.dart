import 'package:api/model/AlbumImageViewModel.dart';
import 'package:api/routes/api_routes.dart';
import 'package:flutter/material.dart';

import 'Album.dart';
import 'controller/post_controller.dart';
import 'model/AlbumsModel.dart';

class Albums extends StatefulWidget {
  final AlbumsModel album;


   Albums({Key key, this.album,}) : super(key: key);

  @override
  _AlbumsState createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  List<AlbumsModel> album= new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Albums();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Albums Title"),
      ),
      // body: Card(
      //   color: Colors.white,
      //   elevation: 5.0,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       Container(
      //
      //         height: 40.0,
      //         child: Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Text(
      //             "Text",
      //             style: TextStyle(color: Colors.black26, fontSize: 22.0),
      //
      //
      //
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      body: Column(
        children: <Widget>[
//          Text("Welcome back " + widget.user.name + "!"),
//          Text("Your Email is  " + widget.user.email)
          album == null
              ? Container
              : Container(
//             height: 40.0,
            height: MediaQuery.of(context).size.height - 85,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0)),

                        ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              album[index].title,
                              style: TextStyle(fontSize: 16),
                            )),
                      ),
                    ),
                    onTap: () {
                       Navigator.push(context,MaterialPageRoute(builder: (context)=> new Album()));

                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
  Albums() async {
    print('users post called');
    album = await getAlbumData();
    setState(() {});
  }

}