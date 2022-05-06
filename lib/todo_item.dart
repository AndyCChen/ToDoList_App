import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todo/task_page.dart';
import 'package:todo/todo_item_provider.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({Key? key, this.title, this.description, required this.deleteItem,}) : super(key: key);
  final String? title;
  final String? description;
  final VoidCallback deleteItem;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isDone = false;
  late String title, description;

  @override
  void initState() {
    title = widget.title!;
    description = widget.description!;
  }

  void _setIsDone() {
    setState(() {
      if(isDone) {
        isDone = false;
      }
      else {
        isDone = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => _setIsDone(),
          child: Container(
            width: 26.0,
            height: 26.0,
            margin: const EdgeInsets.only(
              right: 10.0,
            ),
            decoration: BoxDecoration(
              border: isDone ? null : Border.all(
                color: const Color.fromRGBO(101, 101, 101, 1.0),
                width: 2.0,
              ),
              color: isDone ? const Color.fromRGBO(157, 208, 255, 0.76) : Colors.transparent,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Icon(
              Icons.check,
              color: isDone ? Colors.white : Colors.transparent,
              size: 20.0,
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskPage(
                      deleteItem: widget.deleteItem,
                    ),
                  )
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 25.0,
                horizontal: 20.0,
              ),
              margin: const EdgeInsets.only(
                bottom: 10.0,
              ),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(101, 101, 101, 1.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title?? 'context.watch<TodoModel>().title',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Text(
                      widget.description?? 'context.watch<TodoModel>().description',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
