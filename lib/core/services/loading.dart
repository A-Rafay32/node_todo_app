import 'package:flutter/material.dart';

class Loading extends ChangeNotifier {
  bool isLoading = false;
  void setLoading(bool isloading) {
    isLoading = isloading;
  }
}
