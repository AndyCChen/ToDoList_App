import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({Key? key, this.title, this.description}) : super(key: key);
  final String? title;
  final String? description;


  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isDone = false;

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
                  widget.title?? "(Unnamed task)",
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
                    widget.description?? "Insert task description here",
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
      ],
    );
  }
}
