import 'package:api/utils/api_communication.dart';


Future<Map<String, dynamic>> getAllPosts() => fetch('/posts');

Future<Map<String, dynamic>> getAllComments() => fetch('/comments');

Future<Map<String, dynamic>> postComment(Map<String, dynamic> data) =>
    post('/comments', data);

Future<Map<String, dynamic>> getCommentsOfPost(int postId) =>
    fetch('/comments?postId=$postId');

Future<Map<String, dynamic>> deleteUserPosts(int postId) =>
    delete('/postId=$postId');


Future<Map<String, dynamic>> newPost(Map<String, dynamic> data) =>
    post('/posts', data);

Future<Map<String, dynamic>> getUser() => fetch('/posts');


