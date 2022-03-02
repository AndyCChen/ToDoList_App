import 'package:flutter/material.dart';

class MonthPage extends StatefulWidget {
  final int month, year;

  const MonthPage({Key? key, required this.month, required this.year}) : super(key: key);

  @override
  _MonthPageState createState() => _MonthPageState();
}

class _MonthPageState extends State<MonthPage> {
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

  double topPaddingValue = 25, monthFontSize = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(104, 146, 255, 24),
            centerTitle: true,
            title: Text(monthTitle[widget.month] + ' ' + widget.year.toString(), style: TextStyle(fontSize: monthFontSize))
        ),

        backgroundColor: const Color.fromRGBO(68, 68, 68, 1),

        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: topPaddingValue),
              child: const Text('Su', style: TextStyle(color: Colors.white),),
            ),
            Container(
              padding: EdgeInsets.only(top: topPaddingValue),
              child: const Text('Mo', style: TextStyle(color: Colors.white),),
            ),
            Container(
              padding: EdgeInsets.only(top: topPaddingValue),
              child: const Text('Tu', style: TextStyle(color: Colors.white),),
            ),
            Container(
              padding: EdgeInsets.only(top: topPaddingValue),
              child: const Text('We', style: TextStyle(color: Colors.white),),
            ),
            Container(
              padding: EdgeInsets.only(top: topPaddingValue),
              child: const Text('Th', style: TextStyle(color: Colors.white),),
            ),
            Container(
              padding: EdgeInsets.only(top: topPaddingValue),
              child: const Text('Fr', style: TextStyle(color: Colors.white),),
            ),
            Container(
              padding: EdgeInsets.only(top: topPaddingValue),
              child: const Text('Sa', style: TextStyle(color: Colors.white),),
            ),
          ],
        )
    );
  }
}