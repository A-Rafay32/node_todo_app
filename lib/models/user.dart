class User {
  final String name;
  final String email;
  final String password;
  final String userType;
  User({
    required this.email,
    required this.name,
    required this.password,
    required this.userType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'userType': userType,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: (map["name"] ?? '') as String,
      email: (map["email"] ?? '') as String,
      password: (map["password"] ?? '') as String,
      userType: (map["userType"] ?? '') as String,
    );
  }
}
