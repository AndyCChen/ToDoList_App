import 'package:flutter/material.dart';
import 'task_page.dart';

class TodoItem extends StatefulWidget {
  TodoItem({Key? key, this.title, this.description, required this.isDone, required this.index, required this.timeStamp,}) : super(key: key);
  String? title;
  String? description;
  bool isDone;
  final int timeStamp;
  final int index;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  void _setIsDone() {
    setState(() {
      if(widget.isDone) {
        widget.isDone = false;
      }
      else {
        widget.isDone = true;
      }
    });
  }

  void _setTitle(String title) {
    setState(() {
      widget.title = title;
    });
  }

  void _setDescription(String description) {
    setState(() {
      widget.description = description;
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
              border: widget.isDone ? null : Border.all(
                color: const Color.fromRGBO(101, 101, 101, 1.0),
                width: 2.0,
              ),
              color: widget.isDone ? const Color.fromRGBO(157, 208, 255, 0.76) : Colors.transparent,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Icon(
              Icons.check,
              color: widget.isDone ? Colors.white : Colors.transparent,
              size: 20.0,
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TaskPage(
                  title: widget.title?? '(Unnamed Task)',
                  description: widget.description ?? 'Insert Description',
                  timeStamp: widget.timeStamp,
                  setTitle: _setTitle,
                  setDescription: _setDescription,
                ),
              ),);
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
                    widget.title?? '(Unnamed Task)',
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
                      widget.description ?? 'Insert Description',
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
