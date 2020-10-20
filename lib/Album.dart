import 'dart:convert';

import 'package:api/model/AlbumImageViewModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'AlbumImageView.dart';
import 'controller/post_controller.dart';
import 'model/AlbumsModel.dart';

class Album extends StatefulWidget {
  final AlbumImageViewModel image;
  final AlbumsModel album;
  bool isLoading = false;


  Album({Key key, this.image,this.album}) : super(key: key);



  @override
  _AlbumState createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  List<AlbumImageViewModel> albums= new List();


  ScrollController _scrollController = ScrollController();
  bool isLoading = false;


  @override
  void initState() {
    //this._fetchData();
    super.initState();
    Images();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
      //  _fetchData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildList() {
    return albums.length < 1
        ? Center(
      child: Container(
        child: Text(
          'Loading...',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    )
        : ListView.builder(
      itemCount: 50,
      itemBuilder: (BuildContext context, int index) {
        if (index == albums.length) {
          return _buildProgressIndicator();
        } else {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                  NetworkImage(albums[index].thumbnailUrl),

                ),
                title: Text((albums[index].title)),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (Context)=>AlbumImageView(image:albums[index],)));
                },
              ),
            ),
          );
        }
      },
      controller: _scrollController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Album"),
      ),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
  Images() async {
    print('users album called');
   albums = await getImageData();
    setState(() {});
  }

}