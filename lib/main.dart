import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'TodoListPage/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget checkLoginStatus() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return App();

    } else {
      return LoginScreen();
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'MedievalSharp',
          scaffoldBackgroundColor: const Color.fromRGBO(
              68, 68, 68, 1.0)),
      home: checkLoginStatus(),
    );
  }
}


