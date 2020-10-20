import 'dart:convert';


import 'package:api/model/AlbumImageViewModel.dart';
import 'package:api/model/AlbumsModel.dart';
import 'package:api/model/User.dart';
import 'package:api/model/postfeed.dart';
import 'package:api/routes/api_routes.dart';
import 'package:api/utils/api_communication.dart';
import '../Album.dart';
import '../AlbumsTitle.dart';
import '../routes/api_routes.dart' as api_routes;


Future<List<postfeed>> getPosts() async {
  List<postfeed> posts = [];
  final apiData = await getAllPosts();
  final data = apiData['body'];
  for (Map<String, dynamic> u in data) {
    postfeed post = postfeed.fromJson(u);
    posts.add(post);
  }
  return posts;
}



Future<bool> newPost(postfeed post, String title,String body) async {
  final responseJson = await api_routes.newPost(
    {

      "title": title,
      "body": body,
    },
  );
  final statusCode = responseJson['status_code'] as int;
  if (statusCode == 201) {
    return true;
  } else {
    return false;
  }
}






Future<bool> deleteUserPosts(postfeed post) async {
  final responseJson = await api_routes.deleteUser(post.id);
  final statusCode = responseJson['status_code'] as int;
  if (statusCode == 200) {
    return true;
  } else {
    return false;
  }
}















Future<List<AlbumsModel>> getAlbumData() async {
  List<AlbumsModel> albums = [];
  final responseJson = await api_routes.getAlbum();
  print('album response $responseJson');
  for (Map<String, dynamic> a in responseJson['body']) {
   AlbumsModel album = AlbumsModel.fromJson(a);
    albums.add(album);
  }
  return albums;
}



Future<List<AlbumImageViewModel>> getImageData() async {
  final responseJson = await api_routes.getImage();
  print('imge response $responseJson');
  List<AlbumImageViewModel> images = new List();
 // List list = responseJson['body'];
  for (Map<String, dynamic> a in responseJson['body'] ) {
    AlbumImageViewModel image = AlbumImageViewModel.fromJson(a);
    images.add(image);
  }
  return images;
}





