import 'package:flutter/material.dart';
import 'package:myapp/features/timeline/timeline_page.dart';

class MonthlyPage extends StatelessWidget {
  const MonthlyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      Align(
          alignment: Alignment.centerRight,
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: Text("Monthly",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 50)))),
      TimelinePage()
    ]);
  }
}
