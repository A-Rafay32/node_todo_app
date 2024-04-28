import 'package:flutter/material.dart';
import 'package:node_todo_app/app/config/app_colors.dart';
import 'package:node_todo_app/app/config/app_paddings.dart';
import 'package:node_todo_app/core/extensions/routes_extenstion.dart';
import 'package:node_todo_app/core/extensions/sizes_extensions.dart';
import 'package:node_todo_app/screens/notes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Notes"),
        actions: [
          Icon(Icons.search, color: Colors.white),
          AppSizes.smallX,
          Icon(Icons.menu, color: Colors.white),
          AppSizes.smallX,
        ],
      ),
      body: Container(
        padding: AppPaddings.small,
        child: Column(
          children: [
            Container(
              height: context.h * 0.8,
              width: context.w,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => context.push(NoteScreen()),
                  child: Container(
                    margin: AppPaddings.smallY,
                    padding: AppPaddings.normal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Note $index",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontSize: 17)),
                        Text(
                          "${DateTime.now()}",
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.cardColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          elevation: 2.0,
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: AppColors.secondaryColor,
          )),
    );
  }
}
