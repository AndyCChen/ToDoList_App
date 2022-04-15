import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void _setNavigationBarState(int index) {
      setState(() {
        _selectedIndex = index;

        if (_selectedIndex == 0) {
          Navigator.pushNamed(context, '/W1');
        }
        else {
          Navigator.pushNamed(context, '/W2');
        }
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
