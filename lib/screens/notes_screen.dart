import 'package:flutter/material.dart';
import 'package:node_todo_app/app/config/app_colors.dart';
import 'package:node_todo_app/app/config/app_paddings.dart';
import 'package:node_todo_app/core/extensions/sizes_extensions.dart';
import 'package:node_todo_app/core/utils/time_formatter.dart';
import 'package:node_todo_app/models/notes.dart';
import 'package:node_todo_app/providers/notes_provider.dart';
import 'package:node_todo_app/screens/widgets/button.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatefulWidget {
  NoteScreen({super.key, required this.note});

  final Notes? note;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController descController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    descController.text = widget.note?.description ?? "";
    titleController.text = widget.note?.title ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {},
              child: Icon(Icons.task_alt_outlined, color: Colors.white)),
          AppSizes.smallX,
          Icon(Icons.folder_outlined, color: Colors.white),
          AppSizes.smallX,
          InkWell(
              onTap: () {
                if (widget.note != null)
                  context.read<NotesProvider>().deleteNotes(
                      context: context, noteId: widget.note!.id.toString());
              },
              child: Icon(Icons.delete_outline_rounded, color: Colors.white)),
          AppSizes.smallX,
        ],
      ),
      body: Container(
        padding: AppPaddings.small,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              style: Theme.of(context).textTheme.headlineSmall,
              maxLines: 1,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Untitled",
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey.shade400),
              ),
              // ?.copyWith(fontSize: 17)
            ),
            Text(
              "${formatTime(DateTime.now().toString())}",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.grey.shade400),
            ),
            AppSizes.normalY,
            Container(
              width: context.w,
              child: TextField(
                controller: descController,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.textColor),
                maxLines: (context.h * 0.03).toInt(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Untitled",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey.shade400),
                ),
              ),
            ),
            Spacer(),
            Align(
                alignment: Alignment.center,
                child: Button(
                    isLoading: context.watch<NotesProvider>().loading.isLoading,
                    press: () => context.read<NotesProvider>().updateNote(
                            context: context,
                            note: widget.note!,
                            updatedNote: {
                              "title": titleController.text.trim(),
                              "description": descController.text.trim()
                            }),
                    text: "add"))
          ],
        ),
      ),
    );
  }
}
