import 'package:flutter/material.dart';
import 'task_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TodoItem extends StatefulWidget {
  TodoItem({Key? key, this.title, this.description, required this.isDone, required this.timeStamp,}) : super(key: key);
  String? title;
  String? description;
  bool isDone;
  final int timeStamp;

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

    final User user = FirebaseAuth.instance.currentUser!;
    final db = FirebaseFirestore.instance;

    final isDone = <String, dynamic>{
      'isDone' : widget.isDone,
    };

    db.collection('users').doc(user.uid).collection('todoItems').doc(widget.timeStamp.toString()).set(isDone, SetOptions(merge: true));
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
                  isDone: widget.isDone,
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
                    style: TextStyle(
                      decoration: widget.isDone? TextDecoration.lineThrough : TextDecoration.none,
                      color: widget.isDone? Colors.grey : Colors.white,
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
                      style: TextStyle(
                        decoration: widget.isDone? TextDecoration.lineThrough : TextDecoration.none,
                        color: widget.isDone? Colors.grey : Colors.white,
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
