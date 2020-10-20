

import 'package:api/model/Todos.dart';
import 'package:api/model/User.dart';
import 'package:api/model/postfeed.dart';

import '../routes/api_routes.dart' as api_routes;


Future<List<Todos>> getTodo() async {
  List<Todos> todos = [];
  final responseJson = await api_routes.getTodo();
  for (Map<String, dynamic> u in responseJson['body']) {
    Todos todo = Todos.fromJson(u);
    todos.add(todo);
  }
  return todos;
}




Future<bool> newTodoPost(Todos todos, String title) async {
  List<Todos> todos = [];
  final responseJson = await api_routes.newTodo(
    {
      "title": title,

    },
  );
  final statusCode = responseJson['status_code'] as int;
  if (statusCode == 201) {
    return true;
  } else {
    return false;
  }
}


Future<bool> deleteTodoPosts() async {
   List<Todos> todos = [];

  final responseJson = await api_routes.deleteTodo();
  // for (Map<String, dynamic> u in responseJson['body']) {
  //   Todos todo = Todos.fromJson(u);
  //   todos.add(todo);
  // }
  //return todos;
  final statusCode = responseJson['status_code'] as int;
  if (statusCode == 200) {
    return true;
  } else {
    return false;
  }
}



Future<bool> newUpdateTodo(Todos todos, String title) async {

  final responseJson = await api_routes.updateTodo(todos.id,

    {
      "title": title,

    },

  );
  final statusCode = responseJson['status_code'] as int;
  if (statusCode == 200) {
    return true;
  } else {
    return false;
  }
}




