import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key, required this.deleteItem, required this.setTitle, required this.setDescription, required this.title, required this.description,}) : super(key: key);

  final String title, description;
  final ValueChanged<String> setTitle;
  final ValueChanged<String> setDescription;
  final VoidCallback deleteItem;

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late String title, description;
  late TextEditingController controller1, controller2;

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
              padding: EdgeInsets.symmetric(
                vertical: 12.0,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(101, 101, 101, 1.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TextField(
                controller: controller2,
                onChanged: (value) => description = value,
                maxLength: 300,
                maxLines: 8,
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
