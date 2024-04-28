import 'package:flutter/material.dart';
import 'package:node_todo_app/app/config/app_paddings.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.add, color: Colors.white),
          AppSizes.smallX,
          Icon(Icons.folder_outlined, color: Colors.white),
          AppSizes.smallX,
          Icon(Icons.delete_outline_rounded, color: Colors.white),
          AppSizes.smallX,
        ],
      ),
      body: Container(
        padding: AppPaddings.small,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Notes ",
              style: Theme.of(context).textTheme.headlineSmall,
              // ?.copyWith(fontSize: 17)
            ),
            Text(
              "${DateTime.now()}",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.grey.shade400),
            ),
            AppSizes.largeY,
            Text(
              "Untitled",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.grey.shade400),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
