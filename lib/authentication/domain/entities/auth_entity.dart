import 'auth_error.dart';

class AuthEntity {
  final String userName;
  final String password;
  final AuthError? authError;

  AuthEntity(this.authError,
      {
        required this.userName,
        required this.password
      }
  );
}
