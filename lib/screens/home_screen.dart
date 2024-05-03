import 'package:flutter/material.dart';
import 'package:node_todo_app/app/config/app_colors.dart';
import 'package:node_todo_app/app/config/app_paddings.dart';
import 'package:node_todo_app/core/extensions/routes_extenstion.dart';
import 'package:node_todo_app/core/extensions/sizes_extensions.dart';
import 'package:node_todo_app/core/utils/time_formatter.dart';
import 'package:node_todo_app/core/utils/utils/loader.dart';
import 'package:node_todo_app/models/notes.dart';
import 'package:node_todo_app/providers/auth_provider.dart';
import 'package:node_todo_app/providers/notes_provider.dart';
import 'package:node_todo_app/repositories/notes_repository.dart';
import 'package:node_todo_app/screens/notes_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<NotesProvider>().notesFuture = NotesRepository().getAllNotes();
    // context.read<NotesProvider>().getAllNotes(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Notes"),
        actions: [
          Icon(Icons.search, color: Colors.white),
          AppSizes.smallX,
          InkWell(
              onTap: () => context.read<NotesProvider>().getAllNotes(context),
              child: Icon(Icons.refresh, color: Colors.white)),
          AppSizes.smallX,
          Icon(Icons.menu, color: Colors.white),
          AppSizes.smallX,
        ],
      ),
      body: Container(
        padding: AppPaddings.small,
        child: Column(
          children: [
            Consumer<NotesProvider>(builder: (context, provider, _) {
              return FutureBuilder(
                  future: provider.notesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        provider.loading.isLoading) {
                      return Loader();
                    }
                    if (snapshot.hasData && snapshot.data!.isRight)
                      return Container(
                        height: context.h * 0.8,
                        width: context.w,
                        child: ListView.builder(
                          itemCount: snapshot.data?.right.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => context.push(NoteScreen(
                              note: snapshot.data!.right[index],
                            )),
                            child: Container(
                              margin: AppPaddings.smallY,
                              padding: AppPaddings.normal,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data?.right[index].title ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(fontSize: 15)),
                                  Text(
                                    // "",
                                    "${formatTime(DateTime.now().toString())}",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.secondaryColor
                                      .withOpacity(0.5)),
                            ),
                          ),
                        ),
                      );
                    return Container(
                      height: context.h * 0.7,
                      child: Center(
                        child: Text(
                          "No Notes",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    );
                  });
            })
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          elevation: 2.0,
          onPressed: () => context.read<NotesProvider>().createNotes(
              context: context,
              note:
                  Notes(userId: context.read<AuthProvider>().currentUser?.id)),
          child: Icon(
            Icons.add,
            color: AppColors.secondaryColor,
          )),
    );
  }
}
