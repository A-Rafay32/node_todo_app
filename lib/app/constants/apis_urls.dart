const BASEURL = "http://localhost:3000";

class AuthApi {
  static String signIn = '/auth/sign-in';
  static String signUp = '/auth/sign-up';
  static String signOut = '/auth/sign-out';
}

class TasksApi {
  static String getAllTasks = "/task/";

  static String createTask(String noteId) {
    return "/task/update/$noteId";
  }

  static String updateTaskStatus(String noteId, String taskId) {
    return "/task/done/$noteId/$taskId";
  }

  static String updateTask(String noteId, String taskId) {
    return "/task/update/$noteId/$taskId";
  }

  static String deleteTask(String noteId, String taskId) {
    return "/task/delete/$noteId/$taskId";
  }
}

class NotesApi {
  static String getAllNotes = "/notes/";
  static String createNote = "/notes/create";

  static String getNoteById(String noteId) {
    return "/notes/$noteId";
  }

  static String updateNote(String noteId) {
    return "/notes/update/$noteId";
  }

  static String deleteNote(String noteId) {
    return "/notes/delete/$noteId";
  }
}
