import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/controllers/latest_blog_controller.dart';
import 'package:myapp/models/blogModel/blog.dart';

class LatestBlog extends ConsumerWidget {
  const LatestBlog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogDataValue = ref.watch(blogControllerProvider("method"));
    return Container(
      child: blogDataValue.when(
        data: (blogData) => BlogContent(data: blogData),
        error: (e, __) => Text(e.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class BlogContent extends ConsumerWidget {
  const BlogContent({Key? key, required this.data}) : super(key: key);
  final Blog data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Column(
        children: [
          ListTile(
              leading: const Icon(Icons.favorite),
              title: Text(data.header),
              subtitle: Text(data.shortIntroText)),
          OutlinedButton(
            style: TextButton.styleFrom(padding: const EdgeInsets.all(10)),
            onPressed: () async {
              debugPrint('next page');
              context.goNamed("profile");
            },
            child: const Text('next page'),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
