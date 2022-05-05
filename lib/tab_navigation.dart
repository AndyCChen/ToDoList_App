import 'package:flutter/material.dart';
import 'tab_item.dart';
import 'todo_list_page.dart';

typedef OnPush = void Function(BuildContext context);

class TabNavigationRoutes {
  static const String root = '/';
  static const String todo = '/todo';
}

class TabNavigator extends StatelessWidget {
  const TabNavigator({Key? key, required this.navigatorKey, required this.tabItem}) : super(key: key);

  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;

  void _push (BuildContext context) {
    print('hello');
  }

  Map<String, WidgetBuilder> _routeBuilder(BuildContext context) {
    return {
      TabNavigationRoutes.root : (context) => TodoListPage(onPush: _push),
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
