import 'package:firebase_auth/firebase_auth.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/domain/entities/auth_error.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/domain/use_cases/authenticate_user.dart';

class RemoteAuthenticateUser extends AuthenticateUser {
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AuthError> authenticateUser(String userName, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: userName, password: password);
      return AuthError(
          errorCode: "000", errorMessage: "User was authenticated");
    } on FirebaseAuthException catch (e) {
      return AuthError(
          errorCode: e.code,
          errorMessage: e.message ?? "Ops! Something went wrong");
    }
  }

  @override
  Future<AuthError> createUser(String userName, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: userName, password: password);
      return AuthError(
          errorCode: "000", errorMessage: "User was created successfully");
    } on FirebaseAuthException catch (e) {
      return AuthError(
          errorCode: e.code,
          errorMessage: e.message ?? "Ops! Something went wrong");
    }
  }

  @override
  Future<bool> checkLogin() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return true;
    } else {
      return false;
    }
  }
}
