import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

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

  double gridItemPaddingLeftAndRight = 10, gridItemPaddingTopBottom = 30, monthFontSize = 30, dayFontSize = 20;

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
                padding: EdgeInsets.only(right: gridItemPaddingLeftAndRight, left: gridItemPaddingLeftAndRight, top: gridItemPaddingTopBottom, bottom: gridItemPaddingTopBottom),
                child: Text(dayTitle[i],
                  style: TextStyle(color: Colors.white, fontSize: dayFontSize),),
              );
            }

            return Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              child: DottedBorder(
                color: Colors.white,
                strokeWidth: 1,
                child: Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('1'),
                    style: TextButton.styleFrom(
                      minimumSize: const Size(double.infinity,  double.infinity),
                    ),
                  )
                )
              )
            );
          },

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
            crossAxisCount: 7,
            childAspectRatio: 0.6,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
          )
      ),
    );
  }
}
