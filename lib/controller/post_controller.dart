import 'package:api/model/postfeed.dart';
import 'package:api/routes/api_routes.dart';
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