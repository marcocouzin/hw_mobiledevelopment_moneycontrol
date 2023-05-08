
import '../entities/auth_entity.dart';

abstract class AuthenticateUser {
  Future<void> authenticateUser(String? userName, String? password);
  Future<AuthEntity> createUser(String userName, String password);

}
