import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/features/blog/latest_blog.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const LatestBlog(),
      Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).goNamed("home");
            },
            child: const Text('Go back!'),
          ),
        ),
      )
    ]);
  }
}
