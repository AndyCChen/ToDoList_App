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
  bool isLoading = true;
  late List<int> timeStampList;
  late List<Widget> task;

  @override
  initState(){
    super.initState();
    final timeStamp = DateTime.now().millisecondsSinceEpoch;

    task = [
      TodoItem(
        isDone: false,
        timeStamp: timeStamp,
      ),
    ];

    timeStampList = [
      timeStamp,
    ];

    checkIfTodoListExists();
  }

  void checkIfTodoListExists() async {
    final User user = FirebaseAuth.instance.currentUser!;
    final collectionRef = FirebaseFirestore.instance.collection('users').doc(
        user.uid).collection('todoItems');
    var doc = await collectionRef.limit(1).get();

    if (doc.size != 0) {
      task.clear();
      timeStampList.clear();

      await collectionRef.orderBy('timestamp', descending: false).get().then((QuerySnapshot querySnapshot) => {
        querySnapshot.docs.forEach((doc) {
          setState(() {
            task.add(TodoItem(
                title: doc['title'],
                description: doc['description'],
                isDone: doc['isDone'],
                timeStamp: doc['timestamp'])
            );

            timeStampList.add(doc['timestamp']);
          });
        })
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  void _addItem() {
    setState(() {
      if(task.isEmpty) {
        final timeStamp = DateTime.now().millisecondsSinceEpoch;

        task.insert(0, TodoItem(
          isDone: false,
          timeStamp: timeStamp,
        ),);

        timeStampList.insert(0, timeStamp);
      } else {
        final timeStamp = DateTime.now().millisecondsSinceEpoch;

        task.insert(task.length, TodoItem(
          isDone: false,
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

  void _emptyTodoList() {
    setState(() {
      timeStampList.clear();
      task.clear();
    });

    _emptyTodoListOnDataBase();
  }

  void _emptyTodoListOnDataBase() async{
    final user = FirebaseAuth.instance.currentUser!;
    final todoCollection = FirebaseFirestore.instance.collection('users').doc(user.uid).collection('todoItems');
    final snapShot = await todoCollection.get();

    for(var doc in snapShot.docs) {
      await doc.reference.delete();
    }
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
            isLoading? Center(child: CircularProgressIndicator()) :
            ListView.builder(
              itemCount: task.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  background: Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                        right: 12.0,
                      ),
                      child: Icon(
                        Icons.delete_forever,
                        color: Colors.white,
                        size: 40.0,
                      ),
                    ),
                  ),
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
            ),
            Positioned(
              bottom: 25.0,
              left: 0.0,
              child: GestureDetector(
                onTap: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    backgroundColor: Color.fromRGBO(101, 101, 101, 1.0),
                    title: Text('Delete All Task Items?', style: TextStyle(color: Colors.white),),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () => {Navigator.pop(context)},
                          child: Text('Cancel', style: TextStyle(color: Colors.white),),
                      ),
                      TextButton(
                        onPressed: () => {
                          Navigator.pop(context),
                          _emptyTodoList(),
                        },
                        child: Text('Confirm', style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),
                ),
                child: Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: const Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}

