import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'todo_list_page.dart';
import '../login.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
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
            child: Text( DateFormat.yMMMd().format(DateTime.now()),
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
      body: const TodoListPage(),
    );
  }
}
