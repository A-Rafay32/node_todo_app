import 'package:flutter/material.dart';
import 'package:node_todo_app/app/constants/prefs_keys.dart';
import 'package:node_todo_app/core/services/share_pref.dart';
import 'package:node_todo_app/providers/auth_provider.dart';
import 'package:node_todo_app/core/utils/utils/loader.dart';
import 'package:node_todo_app/providers/notes_provider.dart';
import 'package:node_todo_app/screens/home_screen.dart';
import 'package:node_todo_app/screens/login_screen.dart';
import 'package:provider/provider.dart';

class AuthStateBuilder extends StatefulWidget {
  const AuthStateBuilder();

  @override
  State<AuthStateBuilder> createState() => _AuthStateBuilderState();
}

class _AuthStateBuilderState extends State<AuthStateBuilder> {
  @override
  void initState() {
    UserPrefs.init();
    context.read<AuthProvider>().getSessionInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return context.watch<AuthProvider>().isLoggedIn == true
        // sessionInfo == true
        ? HomeScreen()
        : LoginScreen();
  }
}
