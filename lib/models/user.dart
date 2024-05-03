class User {
  final dynamic token;
  final dynamic id;
  final String name;
  final String email;
  final String password;
  final String userType;
  User({
    this.token = '',
    required this.id,
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

  factory User.fromMap(Map map) {
    return User(
      token: map["token"],
      id: map["_id"],
      name: (map["name"] ?? '') as String,
      email: (map["email"] ?? '') as String,
      password: (map["password"] ?? '') as String,
      userType: (map["userType"] ?? '') as String,
    );
  }
}
