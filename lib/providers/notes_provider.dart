import 'package:flutter/material.dart';
import 'package:node_todo_app/core/extensions/routes_extenstion.dart';
import 'package:node_todo_app/core/extensions/snackbar_ext.dart';
import 'package:node_todo_app/core/services/loading.dart';
import 'package:node_todo_app/core/utils/utils/types.dart';
import 'package:node_todo_app/models/notes.dart';
import 'package:node_todo_app/repositories/notes_repository.dart';
import 'package:node_todo_app/screens/notes_screen.dart';

class NotesProvider extends ChangeNotifier {
  Loading loading = Loading();
  void setLoading(bool isLoading) {
    loading.setLoading(isLoading);
    notifyListeners();
  }

  FutureEither1<List<Notes>>? notesFuture;

  List<Notes> userNotes = [];
  void setUserNotes(List<Notes> notes) {
    userNotes = notes;
    notifyListeners();
  }

  Future<List<Notes>>? getAllNotes(BuildContext context) async {
    List<Notes> userNotes = [];
    setLoading(true);
    notesFuture = NotesRepository().getAllNotes();
    setLoading(false);
    // result.fold((left) => context.showSnackBar(left.message), (right) {
    //   userNotes = right;
    //   print(right);
    // });
    return userNotes;
  }

  void createNotes({required BuildContext context, required Notes note}) async {
    setLoading(true);
    final result = await NotesRepository().createNote(note);
    setLoading(false);
    result.fold((left) => context.showSnackBar(left.message), (right) {
      note = right;
      getAllNotes(context);
      context.push(NoteScreen(note: note));
    });
  }

  void updateNote(
      {required BuildContext context,
      required Notes note,
      required Map updatedNote}) async {
    setLoading(true);
    final result =
        await NotesRepository().updateNote(note.id.toString(), updatedNote);
    setLoading(false);
    result.fold((left) => context.showSnackBar(left.message), (right) {
      print(right);
      getAllNotes(context);
      context.showSnackBar("Note Saved");
    });
    notifyListeners();
  }

  void deleteNotes(
      {required BuildContext context, required String noteId}) async {
    setLoading(true);
    final result = await NotesRepository().deleteNote(noteId);
    setLoading(false);
    result.fold((left) => context.showSnackBar(left.message), (right) {
      context.showSnackBar(right.message);
      getAllNotes(context);
    });
  }
}
