import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> monthTitle = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'MedievalSharp'),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(104, 146, 255, 24),
          centerTitle: true,
          title: Text(monthTitle[2])
        ),

        backgroundColor: const Color.fromRGBO(68, 68, 68, 1),

        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: const <Widget>[
            Text('Su', style: TextStyle(color: Colors.white),),
            Text('Mo', style: TextStyle(color: Colors.white),),
            Text('Tu', style: TextStyle(color: Colors.white),),
            Text('We', style: TextStyle(color: Colors.white),),
            Text('Th', style: TextStyle(color: Colors.white),),
            Text('Fr', style: TextStyle(color: Colors.white),),
            Text('Sa', style: TextStyle(color: Colors.white),),
          ],
        )

      )
    );
  }
}