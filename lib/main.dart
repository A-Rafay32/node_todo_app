import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:node_todo_app/app/config/themes/app_themes.dart';
import 'package:node_todo_app/providers/auth_provider.dart';
import 'package:node_todo_app/providers/notes_provider.dart';
import 'package:node_todo_app/screens/auth_state_builder.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => NotesProvider(),
          ),
        ],
        builder: (context, child) => ScreenUtilInit(
            designSize: const Size(428, 926),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Real Estate',
                theme: AppThemes().theme,
                home: AuthStateBuilder(),
              );
            }));
  }
}
