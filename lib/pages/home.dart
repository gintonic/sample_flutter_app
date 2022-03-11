import 'package:flutter/material.dart';
import 'package:myapp/component.dart';
import 'package:myapp/features/blog/blog_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<StatefulWidget> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Align(
          alignment: Alignment.centerRight,
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: Text("Calendar",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 50)))),
      const Align(
          alignment: Alignment.centerRight,
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 20),
              child: Text("2022",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30)))),
      const BlogPage(),
      Container(
        padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
        child: TextField(
            controller: textController,
            onSubmitted: (String value) async {
              await dialog(value, context);
            }),
      ),
      OutlinedButton(
        style: TextButton.styleFrom(padding: const EdgeInsets.all(10)),
        onPressed: () async {
          debugPrint('Received click');
          await dialog(textController.text, context);
        },
        child: const Text('Click Me'),
      )
    ]);
  }
}
