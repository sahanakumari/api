import 'dart:convert';


import 'package:api/model/AlbumImageViewModel.dart';
import 'package:api/model/AlbumsModel.dart';
import 'package:api/model/User.dart';
import 'package:api/model/postfeed.dart';
import 'package:api/routes/api_routes.dart';
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

Future<List<User>> getUser() async {
  List<User> users = [];
  final responseJson = await api_routes.getUser();
  for (Map<String, dynamic> u in responseJson['body']) {
    User user = User.fromJson(u);
    users.add(user);
  }
  return users;
}
// Future<List<AlbumsModel>> getAlbumData() async {
//   List<AlbumsModel> albums = [];
//   final responseJson = await api_routes.getAlbumData();
//   for (Map<String, dynamic> a in responseJson['body']) {
//     AlbumsModel album  = AlbumsModel.fromJson(a);
//     albums.add(album);
//   }
//   return albums;
// }

// Future<List<AlbumsModel>> getAlbumData() async {
//   final responseJson = await api_routes.getAlbum();
//   final statusCode = responseJson['status_code'] as int;{
//     if (statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return AlbumsModel.fromJson(responseJson);
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

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

// Future<List<AlbumImageViewModel>>  getImageData() async
// {
//   final responseJson = await api_routes.getImage();
//
//
//   List<AlbumImageViewModel> images = [];
//
//    (Map<String, dynamic> a in responseJson['body']){
//     AlbumImageViewModel image = AlbumImageViewModel.fromJson(a);
//     images.add(image);
//   }
//   print(images.length);
//   return images;
// }

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




// // Future<List<postfeed>> deleteUserPosts(postfeed post) async {
// //   List<postfeed> posts = [];
// //   final responseJson = await api_routes.deleteUserPosts(post.id);
// //
// //   for (Map<String, dynamic> u in responseJson['body']) {
// //     postfeed post = postfeed.fromJson(u);
// //     posts.add(post);
// //   }
// //
// //   return posts;
// // }
// //
// // Future<AlbumsModel> fetchAlbum() async {
// //   final response = await api_routes.fetchAlbum(
// //
// //   // if; (response statusCode == 200) {
// //   //   // If the server did return a 200 OK response,
// //   //   // then parse the JSON.
// //   //   return AlbumsModel.fromJson(jsonDecode(response.body));
// //   // } else {
// //   //   // If the server did not return a 200 OK response,
// //   //   // then throw an exception.
// //   //   throw Exception('Failed to load album');
// //   // }
// //   final statusCode = responseJson['status_code'] as int;
// //   if (statusCode == 201) {
// //     return true;
// //   } else {
// //   return false;
// //   }
// // }
// // Future<bool> List<AlbumsModel>> fetchAlbum() async {
// // Future<bool> getAlbum() async {
// //   List<AlbumsModel> albums =[];
// //   final responseJson = await api_routes.getAlbum();
// //   for(Map<String,dynamic> a in responseJson['body']){
// //     AlbumsModel album = AlbumsModel.fromJson(a);
// //     albums.add(album);
// //   }
// //   final statusCode = responseJson['status_code'] as int;
// //   if (statusCode == 200) {
// //     //return true;
// //   } else {
// //     return false;
// //   }
// // }
// Future<List<AlbumsModel>> getAlbum() async {
//   List<AlbumsModel> albums = [];
//   final apiData = await getAlbum();
//   final responseJson = await api_routes.getAlbum();
//   for(Map<String,dynamic> a in responseJson['body']){
//     AlbumsModel album = AlbumsModel.fromJson(a);
//     albums.add(album);
//   }
//   return albums;
// }
