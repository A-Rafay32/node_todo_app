enum TaskCategory {
  Personal,
  Work,
  Shopping,
  Health,
  Other;

  static TaskCategory toCategory(String str) {
    return TaskCategory.values.firstWhere((element) => element.name == str);
  }
}
