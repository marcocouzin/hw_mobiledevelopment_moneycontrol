import 'package:firebase_auth/firebase_auth.dart';

class AuthError {
  final String errorCode;
  final String errorMessage;

  AuthError({required this.errorCode, required this.errorMessage});
}