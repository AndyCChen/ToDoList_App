import 'package:flutter/material.dart';
import 'tab_item.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  var _currentTab = TabItem.today;

  void _selectTab (TabItem tabItem) {
    setState(() {
      _currentTab = tabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _setNavigationBarState(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Today',
            backgroundColor: Color.fromRGBO(104, 146, 255, 0.76),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Tomorrow',
            backgroundColor: Color.fromRGBO(104, 146, 255, 0.76),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(255, 72, 72, 1.0),
        onTap: _setNavigationBarState,
      ),
    );
  }
}
