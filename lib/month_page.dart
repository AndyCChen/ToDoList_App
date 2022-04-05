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

  double gridItemPaddingLeft = 10, gridItemPaddingTop = 25, monthFontSize = 30, dayFontSize = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(104, 146, 255, 24),
          centerTitle: true,
          title: Text(monthTitle[widget.month] + ' ' + widget.year.toString(),
              style: TextStyle(fontSize: monthFontSize))
      ),

      body: GridView.builder(
          itemCount: 42,
          itemBuilder: (context, i) {
            if (i < 7) {
              return Container(
                padding: EdgeInsets.only(left: gridItemPaddingLeft,top: gridItemPaddingTop),
                child: Text(dayTitle[i],
                  style: TextStyle(color: Colors.white, fontSize: dayFontSize),),
              );
            }

            return ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(50, 20),
              ),
              icon: const Icon(Icons.arrow_forward, size: 1),
              label: const Text('Item',
                style: TextStyle(color: Colors.white, fontSize: 5)
              ),
              onPressed: () => {},
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
            crossAxisCount: 7,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          )
      ),
    );
  }
}
