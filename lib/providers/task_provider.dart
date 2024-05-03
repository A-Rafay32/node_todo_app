import 'package:flutter/material.dart';
import 'package:node_todo_app/core/services/loading.dart';

class NotesProvider extends ChangeNotifier {
  Loading loading = Loading();
  void setLoading(bool isLoading) {
    loading.setLoading(isLoading);
    notifyListeners();
  }
}
