import 'package:flutter/material.dart';

class TodoModel extends ChangeNotifier {
  String title = '';
  String description = '';
  bool isUnselected = false;

  void setUnselected() {
    notifyListeners();
  }

  void setTitle(String _title) {
    title = _title;
    notifyListeners();
  }

  void setDescription(String _description) {
    description = _description;
    notifyListeners();
  }
}