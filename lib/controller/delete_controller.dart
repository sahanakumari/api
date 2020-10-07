




import '../routes/api_routes.dart' as api_routes;
import 'package:api/model/Comments.dart';
import 'package:api/model/postfeed.dart';

Future<List<Comments>> deleteUserPosts(postfeed post) async {
  List<Comments> comments = [];
  final responseJson = await api_routes.deleteUserPosts(post.id);
  for (Map<String, dynamic> u in responseJson['body']) {
    Comments comm = Comments.fromJson(u);
    comments.add(comm);
  }
  return comments;
}