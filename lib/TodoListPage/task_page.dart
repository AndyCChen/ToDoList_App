import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key, required this.setTitle, required this.setDescription, required this.title, required this.description, required this.timeStamp,}) : super(key: key);

  final String title, description;
  final int timeStamp;
  final ValueChanged<String> setTitle;
  final ValueChanged<String> setDescription;

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late String title, description;
  late TextEditingController controller1, controller2;

  void addData(String title, String description) {
    final todo = <String, dynamic>{
      'timestamp' : widget.timeStamp,
      'title' : title,
      'description' : description,
    };

    final FirebaseAuth auth = FirebaseAuth.instance;
    final db = FirebaseFirestore.instance;

    User user = auth.currentUser!;
    db.collection('users').doc(user.uid).collection('todoItems').doc(widget.timeStamp.toString()).set(todo);
  }

  @override
  void initState() {
    title = widget.title;
    description = widget.description;
    if (title != '(Unnamed Task)') {
      controller1 = TextEditingController(text: title);
    } else {
      controller1 = TextEditingController(text: '');
    }
    if (description != 'Insert Description') {
      controller2 = TextEditingController(text: description);
    } else {
      controller2 = TextEditingController(text: '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 10.0,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      widget.setTitle(title);
                      widget.setDescription(description);
                      addData(title, description);
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(30.0),
                    splashColor: const Color.fromRGBO(157, 208, 255, 0.76),
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: controller1,
                      onChanged: (value) => title = value,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 24.0
                        ),
                        hintText: "Title",
                        border: InputBorder.none,
                        counterText: '',
                      ),
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                      maxLength: 25,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: TextField(
                controller: controller2,
                onChanged: (value) => description = value,
                maxLines: null,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                  ),
                  hintText: 'Description',
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
