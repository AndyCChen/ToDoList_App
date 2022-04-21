import 'package:flutter/material.dart';
import 'tab_item.dart';
import 'navigation_bar.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var _currentTab = TabItem.today;

  void _selectTab (TabItem tabItem) {
    setState(() {
      _currentTab = tabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        currentTab: _currentTab,
        selectedTab: _selectTab,
      ),
    );
  }
}
