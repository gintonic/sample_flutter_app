import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/blogModel/blog.dart';

class HttpBlogRepository {
  final http.Client client;

  HttpBlogRepository({required this.client});

  Future<Blog> getOneBlog({required String path}) => _getData(
        path: path,
        builder: (data) => Blog.fromJson(data),
      );

  Future<T> _getData<T>(
      {required String path, required T Function(dynamic data) builder}) async {
    try {
      final uri = Uri.http('127.0.0.1:1337', path);
      final response = await client.get(uri);
      switch (response.statusCode) {
        case 200:
          final data = jsonDecode(response.body);
          return builder(data["blog"]);
        default:
          throw const AsyncValue.error("Some error occurred");
      }
    } catch (err) {
      throw AsyncValue.error(err);
    }
  }
}

final blogRepositoryProvider = Provider<HttpBlogRepository>((ref) {
  return HttpBlogRepository(client: http.Client());
});
