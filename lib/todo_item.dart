import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key, this.title, this.description}) : super(key: key);
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            title ?? "(Unnamed Task)",
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
              description ?? "todo...",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
