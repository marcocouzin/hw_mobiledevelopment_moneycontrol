import '../entities/auth_error.dart';

abstract class AuthenticateUser {
  Future<AuthError> authenticateUser(String userName, String password);
  Future<AuthError> createUser(String userName, String password);
}
