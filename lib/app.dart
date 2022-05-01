import 'package:flutter/material.dart';
import 'tab_item.dart';
import 'navigation_bar.dart';
import 'tab_navigation.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var _currentTab = TabItem.today;

  final _navigatorKeys = {
    TabItem.today: GlobalKey<NavigatorState>(),
    TabItem.tomorrow: GlobalKey<NavigatorState>(),
  };

  void _selectTab (TabItem tabItem) {
    setState(() {
      _currentTab = tabItem;
    });
  }

  Widget _buildNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: tabIndex[_currentTab],
        children: <Widget>[
        _buildNavigator(TabItem.today),
        _buildNavigator(TabItem.tomorrow),
      ]),
      bottomNavigationBar: CustomNavigationBar(
        currentTab: _currentTab,
        selectedTab: _selectTab,
      ),
    );
  }
}
