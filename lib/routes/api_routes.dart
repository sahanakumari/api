import 'package:api/utils/api_communication.dart';


Future<Map<String, dynamic>> getAllPosts() => fetch('/posts');

Future<Map<String, dynamic>> getAllComments() => fetch('/comments');

Future<Map<String, dynamic>> postComment(Map<String, dynamic> data) =>
    post('/comments', data);

Future<Map<String, dynamic>> getCommentsOfPost(int postId) =>
    fetch('/comments?postId=$postId');

Future<Map<String, dynamic>> deleteUser(int postId) =>
    delete('/posts/postId');


Future<Map<String, dynamic>> newPost(Map<String, dynamic> data) =>
    post('/posts', data);

Future<Map<String, dynamic>> getUser() => fetch('/users');

Future<Map<String, dynamic>> getAlbum() => fetch('/albums');
Future<Map<String, dynamic>> getImage() => fetch('/photos');
Future<Map<String, dynamic>> getTodo() => fetch('/todos');

Future<Map<String, dynamic>> newTodo(Map<String, dynamic> data) =>
    post('/todos', data);

Future<Map<String, dynamic>> deleteTodo() =>
    delete('/todos/id');

Future<Map<String, dynamic>> updateTodo(int id ,Map<String, dynamic> body) =>
    put('/todos/id=$id',body);


