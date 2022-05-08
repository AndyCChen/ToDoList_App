import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_item_provider.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key, required this.deleteItem,}) : super(key: key);

  final VoidCallback deleteItem;

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
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
                          onSubmitted: (value) => Provider.of<TodoModel>(context, listen: false).setTitle(value),
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
                TextField(
                  onSubmitted: (value) => Provider.of<TodoModel>(context, listen: false).setDescription(value),
                  maxLength: 100,
                  decoration: const InputDecoration(
                    counterText: '',
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
              ],
            ),
            Positioned(
              bottom: 25.0,
              right: 25.0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.deleteItem();
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 72, 72, 1.0),
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
