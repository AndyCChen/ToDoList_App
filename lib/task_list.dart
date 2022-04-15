import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  final int number;
  const TaskList({Key? key, required this.number}) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Dummy Text ' + widget.number.toString()),
          ],
        )
      ],
    );
  }
}

List<Widget> getPages() {
  List <Widget> pages = List.empty(growable: true);

  for (int i = 0; i < 2; i++) {
    pages.add(TaskList(number: i,));
  }

  return pages;
}