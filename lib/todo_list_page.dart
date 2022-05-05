import 'package:flutter/material.dart';
import 'todo_item.dart';
import 'task_page.dart';
import 'tab_navigation.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key, required this.onPush,}) : super(key: key);

  final OnPush onPush;

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  late List<Widget> task;

  @override
  initState() {
    task = [
      TodoItem(onPush: widget.onPush,),
    ];
  }

  void _addItem() {
    setState(() {
      task.insert(task.length - 1, TodoItem(onPush: widget.onPush,),);
    });
  }

  void _deleteItem() {
    setState(() {
      task.removeAt(task.length - 1);
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 0.0,
          horizontal: 25.0,
        ),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: task.length,
              itemBuilder: (BuildContext context, int index) {
                return TodoItem(onPush: widget.onPush,);
              }
            ),
            Positioned(
              bottom: 25.0,
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  _addItem();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskPage(
                          deleteItem: _deleteItem,
                        ),
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

