import 'package:api/model/postfeed.dart';
import 'package:api/routes/api_routes.dart';

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