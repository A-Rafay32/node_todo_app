import 'package:flutter/material.dart';
import 'package:node_todo_app/core/extensions/snackbar_ext.dart';
import 'package:node_todo_app/core/services/loading.dart';
import 'package:node_todo_app/core/services/share_pref.dart';
import 'package:node_todo_app/models/user.dart';
import 'package:node_todo_app/repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  static String token = '';
  User? currentUser;
  Loading loading = Loading();
  bool? isLoggedIn = false;

  void setLoading(bool isLoading) {
    loading.setLoading(isLoading);
    notifyListeners();
  }

  void getSessionInfo() async {
    isLoggedIn = await UserPrefs.getUserSession();
    print(isLoggedIn);
    notifyListeners();
  }

  void signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    setLoading(true);
    final result =
        await AuthRepository().signIn(email: email, password: password);
    setLoading(false);
    result.fold((left) => context.showSnackBar(left.message), (right) async {
      print(right);
      await UserPrefs.setUserSession(true);
      isLoggedIn = await UserPrefs.getUserSession();
      print(isLoggedIn);
      token = right.token;
      currentUser = right;
      print(token);
    });
  }
}
