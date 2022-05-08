import 'package:flutter/material.dart';

class TodoModel extends ChangeNotifier {
  String title = '(Unnamed Task)';
  String description = 'Insert Description';

  void setTitle(String _title) {
    title = _title;
    notifyListeners();
  }

  void setDescription(String _description) {
    description = _description;
    notifyListeners();
  }
}