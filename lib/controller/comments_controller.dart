import 'package:api/model/Comments.dart';
import 'package:api/model/User.dart';
import 'package:api/model/postfeed.dart';

import '../routes/api_routes.dart' as api_routes;

getAllComments() async {
  final apiData = await api_routes.getAllComments();
}

Future<bool> postComment(User user, String comment) async {
  final responseJson = await api_routes.postComment(
    {
      "id": user.id,
      "name": user.name,
      "email": user.email,
      "body": comment,
    },
  );
  final statusCode = responseJson['status_code'] as int;
  if (statusCode == 201) {
    return true;
  } else {
    return false;
  }
}

Future<List<Comments>> getCommentsOfPost(postfeed post) async {
  List<Comments> comments = [];
  final responseJson = await api_routes.getCommentsOfPost(post.id);
  for (Map<String, dynamic> u in responseJson['body']) {
    Comments comm = Comments.fromJson(u);
    comments.add(comm);
  }
  return comments;
}


