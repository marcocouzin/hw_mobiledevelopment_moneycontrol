
import '../entities/auth_entity.dart';

abstract class AuthenticateUser {
  AuthEntity authenticateUser(String userName, String password);
  AuthEntity createUser(String userName, String password);

}
