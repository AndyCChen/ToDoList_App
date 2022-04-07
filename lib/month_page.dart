
import 'dart:ui';

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

  List<String> dayTitle = [
    'Su',
    'Mo',
    'Tu',
    'We',
    'Th',
    'Fr',
    'Sa',
  ];

  double rowPaddingValue = 15, monthFontSize = 30, dayFontSize = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(104, 146, 255, 24),
          centerTitle: true,
          title: Text(monthTitle[widget.month] + ' ' + widget.year.toString(),
              style: TextStyle(fontSize: monthFontSize))
      ),

      body: Column (children: <Widget>[
        GridView.count(
            crossAxisCount: 7,
            shrinkWrap: true,
            children: [
              for (var day in dayTitle) Center(
                child: Text(day,
                  style: TextStyle(
                    fontSize: dayFontSize,
                    color: Colors.white),
                )
              ),
            ],
        ),
        GridView.builder(
          itemCount: 42,
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return TextButton(
              onPressed: () {},
              child: const Text('1'),
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity,  double.infinity),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                primary: Colors.white,
                backgroundColor: const Color.fromRGBO(157, 208, 255, 1.0),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
            crossAxisCount: 7,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          )
        ),
      ])
    );
  }
}
