import 'package:either_dart/either.dart';
import 'package:node_todo_app/app/constants/apis_urls.dart';
import 'package:node_todo_app/core/exceptions/exceptions.dart';
import 'package:node_todo_app/core/services/http_service.dart';
import 'package:node_todo_app/core/utils/utils/types.dart';
import 'package:node_todo_app/models/notes.dart';

class NotesRepository {
  FutureEither1<List<Notes>> getAllNotes() async {
    try {
      dynamic response = await HttpService().get(NotesApi.getAllNotes);
      print(response);
      return Right((response as List).map((e) => Notes.fromJson(e)).toList());
    } catch (e) {
      print(e);
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither1<Notes> getNoteById(String noteId) async {
    try {
      dynamic response = await HttpService().get(NotesApi.getNoteById(noteId));
      return Right(Notes.fromJson(response));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither1<Notes> createNote(Notes note) async {
    try {
      dynamic response = await HttpService()
          .post(NotesApi.createNote, requestBody: note.toJson());
      return Right(Notes.fromJson(response as Map));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither1<Notes> updateNote(String noteId, Map updatedNote) async {
    try {
      dynamic response = await HttpService()
          .patch(NotesApi.updateNote(noteId), requestBody: updatedNote);
      return Right(Notes.fromJson(response));
    } catch (e) {
      print(e);
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither0 deleteNote(String noteId) async {
    try {
      await HttpService().delete(
          NotesApi.deleteNote(noteId), {}).catchError((error) => throw error);

      return Right(Success(message: "Note deleted successfully"));
    } catch (e) {
      print(e);
      return Left(Failure(message: e.toString()));
    }
  }
}
