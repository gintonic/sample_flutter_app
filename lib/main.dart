import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/component.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/login.dart';
import 'package:myapp/pages/monthly.dart';
import 'package:myapp/pages/profile.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static const title = "My App";

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<StatefulWidget> {
  // final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: MyApp.title,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.dark,
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          maxWidth: double.infinity,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.autoScale(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      debugShowCheckedModeBanner: false,
    );
  }

  late final _router = GoRouter(
      initialLocation: "/login",
      routes: [
        GoRoute(
          name: 'login',
          path: '/login',
          builder: (context, state) => _build(const LoginPage()),
        ),
        GoRoute(
          name: 'home',
          path: '/',
          builder: (context, state) => _build(const HomePage()),
        ),
        GoRoute(
          name: 'monthly',
          path: '/monthly',
          builder: (context, state) => _build(const MonthlyPage()),
        ),
        GoRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, state) => _build(const ProfilePage()),
        ),
      ],
      errorPageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: Scaffold(body: Center(child: Text(state.error.toString())))),
      debugLogDiagnostics: true,
      navigatorBuilder: (context, state, child) => Navigator(
              onPopPage: (route, dynamic result) {
                route.didPop(result);
                return false; // don't pop the single page on the root navigator
              },
              pages: [
                MaterialPage<void>(
                  child: state.error != null
                      ? ErrorScaffold(body: child)
                      : SharedScaffold(
                          selectedIndex: state.subloc == '/' ? 0 : 1,
                          selectedPath: state.subloc,
                          // drawerKey: _drawerKey,
                          body: child,
                        ),
                ),
              ]));
  Widget _build(Widget child) {
    return Container(
        decoration: imageBG(),
        child: Scaffold(
            // key: _drawerKey,
            backgroundColor: Colors.transparent,
            // drawer: drawer(context),
            body: child));
  }
}

class SharedScaffold extends StatefulWidget {
  const SharedScaffold({
    required this.selectedIndex,
    required this.selectedPath,
    required this.body,
    // required this.drawerKey,
    Key? key,
  }) : super(key: key);

  final int selectedIndex;
  final String selectedPath;
  final Widget body;
  // final GlobalKey<ScaffoldState> drawerKey;

  @override
  State<SharedScaffold> createState() => _SharedScaffoldState();
}

class _SharedScaffoldState extends State<SharedScaffold> {
  @override
  Widget build(BuildContext context) {
    debugPrint(widget.selectedPath);
    var destinationsArr = [
      const AdaptiveScaffoldDestination(title: 'Home', icon: Icons.home),
      const AdaptiveScaffoldDestination(
          title: 'Monthly', icon: Icons.calendar_view_month),
      const AdaptiveScaffoldDestination(
          title: 'Profile', icon: Icons.supervised_user_circle),
      const AdaptiveScaffoldDestination(title: 'Logout', icon: Icons.logout)
    ];

    // if (!_drawerSize) {
    //   destinationsArr.add(
    //       const AdaptiveScaffoldDestination(title: 'Menu', icon: Icons.menu));
    // }

    return AdaptiveNavigationScaffold(
      selectedIndex: widget.selectedIndex,
      drawerEnableOpenDragGesture: widget.selectedPath != "/login",
      destinations: destinationsArr,
      appBar: widget.selectedPath == "/login"
          ? null
          : AdaptiveAppBar(title: const Text(MyApp.title)),
      navigationTypeResolver: (context) =>
          _drawerSize || widget.selectedPath == "/login"
              ? NavigationType.drawer
              : NavigationType.bottom,
      onDestinationSelected: (index) async {
        // if there's a drawer, close it
        if (_drawerSize) Navigator.pop(context);

        switch (index) {
          case 0:
            context.goNamed('home');
            break;
          case 1:
            context.goNamed('monthly');
            break;
          case 2:
            context.goNamed('profile');
            break;
          case 3:
            context.goNamed('login');
            break;
          // case 4:
          //   debugPrint(widget.drawerKey.currentState.toString());
          //   widget.drawerKey.currentState?.openDrawer();
          //   break;
          default:
            throw Exception('Invalid index');
        }
      },
      body: widget.body,
    );
  }

  bool get _drawerSize => MediaQuery.of(context).size.width >= 600;
}

class ErrorScaffold extends StatelessWidget {
  const ErrorScaffold({
    required this.body,
    Key? key,
  }) : super(key: key);

  final Widget body;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AdaptiveAppBar(title: const Text('Page Not Found')),
        body: body,
      );
}

// Widget drawer(context) => Drawer(
//       // Add a ListView to the drawer. This ensures the user can scroll
//       // through the options in the drawer if there isn't enough vertical
//       // space to fit everything.
//       child: ListView(
//         // Important: Remove any padding from the ListView.
//         padding: EdgeInsets.zero,
//         children: [
//           ListTile(
//             title: const Text('Home'),
//             onTap: () {
//               GoRouter.of(context).goNamed('home');
//             },
//           ),
//           ListTile(
//             title: const Text('Monthly'),
//             onTap: () {
//               GoRouter.of(context).goNamed('monthly');
//             },
//           ),
//           ListTile(
//             title: const Text('Profile'),
//             onTap: () {
//               context.goNamed('profile');
//             },
//           ),
//           ListTile(
//             title: const Text('Logout'),
//             onTap: () {
//               context.goNamed('login');
//             },
//           ),
//         ],
//       ),
//     );
