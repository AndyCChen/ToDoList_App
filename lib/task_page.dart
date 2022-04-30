import 'dart:ui';

import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
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
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 24.0
                          ),
                          hintText: "Title",
                          border: InputBorder.none,
                          counterText: '',
                        ),
                        style: TextStyle(
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
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 18.0,
                  color: Colors.grey,
                  ),
                  hintText: "Description",
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),

      ),
    );

  }
}
