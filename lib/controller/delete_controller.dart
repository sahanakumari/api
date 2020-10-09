import '../routes/api_routes.dart' as api_routes;
import 'package:api/model/postfeed.dart';

Future<List<postfeed>> deleteUserPosts(postfeed post) async {
  List<postfeed> posts = [];
  final responseJson = await api_routes.deleteUserPosts(post.id);
  for (Map<String, dynamic> u in responseJson['body']) {
    postfeed post = postfeed.fromJson(u);
    posts.add(post);
  }
  return posts;
}