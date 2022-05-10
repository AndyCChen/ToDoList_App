import 'package:flutter/material.dart';
import 'task_page.dart';
import '../Provider/todo_item_provider.dart';
import 'package:provider/provider.dart';

class TodoItem extends StatefulWidget {
  TodoItem({Key? key, required this.title, required this.description, required this.deleteItem, required this.isDone, this.selected}) : super(key: key);
  String title;
  String description;
  final bool? selected;
  final VoidCallback deleteItem;
  bool isDone;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late bool isSelected;

  @override
  initState() {
    isSelected = widget.selected?? context.watch<TodoModel>().isUnselected;
  }

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

  @override
  Widget build(BuildContext context) {
    print('$isSelected');
    widget.title = isSelected? context.watch<TodoModel>().title : widget.title;
    widget.description = isSelected? context.watch<TodoModel>().description : widget.description;
    isSelected = false;


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
              isSelected = true;
              print('second isSelected: $isSelected');
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TaskPage(deleteItem: widget.deleteItem, isDelete: false,),),);
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
                    widget.title,
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
                      widget.description,
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
