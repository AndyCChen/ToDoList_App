import 'package:flutter/material.dart';

class DayScreens extends StatefulWidget {
  final String date;
  final String widgetName;
  const DayScreens({Key? key, required this.date, required this.widgetName}) : super(key: key);

  @override
  _DayScreensState createState() => _DayScreensState();
}

class _DayScreensState extends State<DayScreens> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: const Color.fromRGBO(104, 146, 255, 0.76),
          title: Text(widget.date.toString(),
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

    );
  }
}

