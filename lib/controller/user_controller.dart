
import 'package:api/model/User.dart';

import '../routes/api_routes.dart' as api_routes;


Future<List<User>> getUser() async {
  List<User> users = [];
  final responseJson = await api_routes.getUser();
  for (Map<String, dynamic> u in responseJson['body']) {
    User user = User.fromJson(u);
    users.add(user);
  }
  return users;
}