
class AuthModel {
  final String userName;
  final String password;

  AuthModel({required this.userName, required this.password});

  // factory AuthModel.fromMap(Map<String, dynamic> map) => MovieModel(
  //   name: map['original_title'],
  //   description: map['overview'],
  //   image: map['poster_path'],
  // );

  // AuthEntity toEntity() =>
  //     AuthEntity(userName: userName, password: password);
}
