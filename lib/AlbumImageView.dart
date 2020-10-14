import 'package:api/model/AlbumImageViewModel.dart';
import 'package:api/model/AlbumsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'controller/post_controller.dart';


class AlbumImageView extends StatefulWidget {
  final AlbumImageViewModel image ;
  final AlbumsModel album;


  AlbumImageView({Key key, this.image,this.album}) : super(key: key);


  @override
  _AlbumImageViewState createState() => _AlbumImageViewState();
}

class _AlbumImageViewState extends State<AlbumImageView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Album Image"),
      ),
      // body: Container(
      //
      //   child: FutureBuilder(
      //     future: getImageData(),
      //     builder: (BuildContext context, AsyncSnapshot snapshot){
      //       print(snapshot.data);
      //       if (snapshot.data == null) {
      //         return Container(child: Center(child: Text("Loading....")
      //         )
      //         );
      //       } else {
      //         return ListView.builder(
      //           itemCount: snapshot.data.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             return ListTile(
      //               leading: CircleAvatar(
      //                 backgroundImage:
      //                 NetworkImage(snapshot.data[index].url),
      //               ),
      //
      //               onTap: () {
      //               },
      //             );
      //           },
      //         );
      //       }
      //     },
      //   ),
      // ),
      body: Column(
        children: <Widget>[
//          Text("Welcome back " + widget.user.name + "!"),
//          Text("Your Email is  " + widget.user.email)
          widget.image == null
              ? Container
              : Container(
            padding: EdgeInsets.all(10),

height: 250,
          // height: MediaQuery.of(context).size.height - 85,
            child:  new ClipRRect(
              
                borderRadius: new BorderRadius.circular(10.0),
                child: Image.network(widget.image.url,
                    fit: BoxFit.cover,
                    height: 60.0, width: 380.0)

            ),
          ),
        ],
      ),
    );

  }
 }
