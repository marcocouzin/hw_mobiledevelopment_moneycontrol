import 'package:firebase_auth/firebase_auth.dart';

class AuthError {
  FirebaseAuthException error;

  AuthError({required this.error});
}