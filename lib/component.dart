import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

imageBG() {
  return const BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/images/gradient.jpg"), fit: BoxFit.cover));
}

dialog(String value, BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Thanks!'),
        content: Text(
            'You typed "$value", which has length ${value.characters.length}.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

defaultDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          title: const Text('Home'),
          onTap: () {
            context.goNamed("home");
          },
        ),
        ListTile(
          title: const Text('Monthly'),
          onTap: () {
            context.goNamed("monthly");
          },
        ),
        ListTile(
          title: const Text('Logout'),
          onTap: () {
            context.goNamed("login");
          },
        ),
      ],
    ),
  );
}
