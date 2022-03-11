import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: Column(
          children: [
            const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                    child: Text("LOGIN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 50)))),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Email address',
                      hintText: 'insert your email address ...')),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'insert your password ...')),
            ),
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: OutlinedButton(
                  style:
                      TextButton.styleFrom(padding: const EdgeInsets.all(10)),
                  onPressed: () async {
                    context.goNamed("home");
                  },
                  child: const Text('Submit'),
                ))
          ],
        ));
  }
}
