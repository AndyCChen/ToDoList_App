import 'task_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List <Widget> pages = getPages();

  var today = DateFormat.yMMMd().format(DateTime.now());

  int _selectedIndex = 0;

  void _setNavigationBarState(int index) {
    setState(() {
      _selectedIndex = index;
      today = (_selectedIndex == 0) ? 
        DateFormat.yMMMd().format(DateTime.now()) :
        DateFormat.yMMMd().format(DateTime.now().add(const Duration(days: 1)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: const Color.fromRGBO(104, 146, 255, 0.76),
          title: Text(today,
            style: const TextStyle(fontSize: 25.0),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.0),
            )
          ),
        ),
      ),
      body: pages[_selectedIndex],
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
        selectedItemColor: Color.fromRGBO(255, 72, 72, 1.0),
        onTap: _setNavigationBarState,
      ),
    );
  }
}
