import 'package:flutter/material.dart';
import 'package:myapp/features/blog/latest_blog.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
        rowMainAxisAlignment: MainAxisAlignment.center,
        rowPadding: const EdgeInsets.all(30),
        columnPadding: const EdgeInsets.all(30),
        layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: const [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: LatestBlog(),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: LatestBlog(),
          )
        ]);
  }
}
