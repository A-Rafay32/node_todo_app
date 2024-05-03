import 'package:either_dart/either.dart';
import 'package:node_todo_app/app/constants/apis_urls.dart';
import 'package:node_todo_app/core/exceptions/exceptions.dart';
import 'package:node_todo_app/core/services/http_service.dart';
import 'package:node_todo_app/core/utils/utils/types.dart';
import 'package:node_todo_app/models/tasks.dart';

class TaskRepository {
  FutureEither1<List<Task>> getAllTasks() async {
    try {
      dynamic response = await HttpService().get(TasksApi.getAllTasks);
      return Right(
          (response as List).map((e) => Task.fromJson(e as Map)).toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither0 createTask() async {
    try {
      // await HttpService().post(AuthApi.signIn, requestBody: {});
      return Right(Success(message: "User signed in with "));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither0 updateTask() async {
    try {
      // await HttpService().post(AuthApi.signIn, requestBody: {});
      return Right(Success(message: "User signed in with "));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither0 updateTaskStatus() async {
    try {
      // await HttpService().post(AuthApi.signIn, requestBody: {});
      return Right(Success(message: "User signed in with "));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither0 deleteTask() async {
    try {
      // await HttpService().post(AuthApi.signIn, requestBody: {});
      return Right(Success(message: "User signed in with "));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
