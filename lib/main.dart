import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'home_page.dart';
import 'day_screens.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget todayPage = DayScreens(
      date: DateFormat.yMMMd().format(DateTime.now()),
      widgetName: '/W1',
    );

    Widget tomorrowPage = DayScreens(
      date: DateFormat.yMMMd().format(DateTime.now().add(const Duration(days: 1))),
      widgetName: '/W2',
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'MedievalSharp', scaffoldBackgroundColor: const Color.fromRGBO(68, 68, 68, 1)),
      home: const HomePage(),
      routes: {
        '/W1' : (context) => todayPage,
        '/W2' : (context) => tomorrowPage,
      },
    );
  }
}


