import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key, required this.deleteItem, required this.setTitle, required this.setDescription}) : super(key: key);

  final VoidCallback deleteItem;
  final ValueChanged<String> setTitle;
  final ValueChanged<String> setDescription;

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
                          onChanged: (value) {
                            print("String: $value");
                          },
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
                const TextField(
                  maxLength: 100,
                  decoration: InputDecoration(
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
                  style: TextStyle(
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
