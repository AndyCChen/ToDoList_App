import 'package:flutter/material.dart';

class TodoModel extends ChangeNotifier {
   String title = '(Unnamed task)';
   String description ='Insert task description here';

  String get tit => title;
  String get desc => description;

  void setTitle(String _title) {
    title = _title;
    notifyListeners();
  }

  void setDescription(String _description) {
    description = _description;
    notifyListeners();
  }
}