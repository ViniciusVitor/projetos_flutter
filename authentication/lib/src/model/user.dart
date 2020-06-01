class User {
  String email;
  String password;

  User({this.email, this.password});

  /// Instancia um usuário a partir de um json
  factory User.fromJson(Map<String, dynamic> json) =>
      User(email: json["email"], password: json["password"]);

  /// Retorna um json com os dados do usuário
  Map<String, dynamic> toJson() =>
      {"email": this.email, "password": this.password};

  @override
  String toString() => "User { email: $email, password: $password }";
}
