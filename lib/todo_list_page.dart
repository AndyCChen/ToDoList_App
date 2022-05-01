import 'package:flutter/material.dart';
import 'todo_item.dart';
import 'task_page.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key, required this.date, this.onPush}) : super(key: key);

  final String date;
  final ValueChanged<int>? onPush;

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: const Color.fromRGBO(104, 146, 255, 0.76),
            title: SafeArea(
              child: Text(widget.date.toString(),
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
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 0.0,
          horizontal: 25.0,
        ),
        child: Stack(
          children: [
            ListView(
              children: [
                TodoItem(
                  title: "Work on app",
                ),
                TodoItem(),
                TodoItem(),
                TodoItem(),
                TodoItem(),
                TodoItem(),
                TodoItem(),
                TodoItem(),
                TodoItem(),
              ],
            ),
            Positioned(
              bottom: 25.0,
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskPage(),
                      )
                  );
                },
                child: Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(157, 208, 255, 0.76),
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

