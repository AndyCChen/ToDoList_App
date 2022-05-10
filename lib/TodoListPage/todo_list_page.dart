import 'package:flutter/material.dart';
import 'todo_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key,}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  late List<int> timeStampList;
  late List<Widget> task;

  @override
  initState() {
    final timeStamp = DateTime.now().millisecondsSinceEpoch;

    task = [
      TodoItem(
        isDone: false,
        index: 0,
        timeStamp: timeStamp,
      ),
    ];

    timeStampList = [
      timeStamp,
    ];
  }

  void _addItem() {
    setState(() {
      if(task.isEmpty) {
        final timeStamp = DateTime.now().millisecondsSinceEpoch;

        task.insert(0, TodoItem(
          isDone: false,
          index: 0,
          timeStamp: timeStamp,
        ),);

        timeStampList.insert(0, timeStamp);
      } else {
        final timeStamp = DateTime.now().millisecondsSinceEpoch;

        task.insert(task.length, TodoItem(
          isDone: false,
          index: task.length,
          timeStamp: timeStamp,
        ),);

        timeStampList.insert(timeStampList.length, timeStamp);
      }
    });
  }

  void _deleteFromDatabase(int index) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final db = FirebaseFirestore.instance;

    User user =  auth.currentUser!;
    db.collection('users').doc(user.uid).collection('todoItems').doc(timeStampList[index].toString()).delete();
  }

  void _deleteItem(int index) {
    setState(() {
      timeStampList.removeAt(index);
      task.removeAt(index);
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
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) {
                    setState(() {
                      _deleteFromDatabase(index);
                      _deleteItem(index);
                    });
                  },
                  child: task[index],
                );
              }
            ),
            Positioned(
              bottom: 25.0,
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  _addItem();
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

