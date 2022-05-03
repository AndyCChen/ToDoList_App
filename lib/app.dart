import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'tab_item.dart';
import 'navigation_bar.dart';
import 'tab_navigation.dart';
import 'login.dart';

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
    final auth = FirebaseAuth.instance;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          leading:  GestureDetector(
            onTap: () async {
              await auth.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()),
                      (Route<dynamic> route) => false
              );
            },
            child: const Icon(Icons.logout),
          ),
          backgroundColor: const Color.fromRGBO(104, 146, 255, 0.76),
          title: SafeArea(
            child: Text(tabDate[_currentTab].toString(),
              style: const TextStyle(fontSize: 25.0),
            ),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0),
              )
          ),
        ),
      ),
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
