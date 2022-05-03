import 'package:flutter/material.dart';
import 'tab_item.dart';
import 'todo_list_page.dart';

class TabNavigationRoutes {
  static const String root = '/';
  static const String todo = '/todo';
}

class TabNavigator extends StatelessWidget {
  const TabNavigator({Key? key, required this.navigatorKey, required this.tabItem}) : super(key: key);

  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;

  void _push (BuildContext context) {
    var routeBuilder = _routeBuilder(context);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              routeBuilder[TabNavigationRoutes.todo]!(context),
        ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilder(BuildContext context) {
    return {
      TabNavigationRoutes.root : (context) => const TodoListPage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilder = _routeBuilder(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigationRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilder[routeSettings.name!]! (context),
        );
      },
    );
  }
}
