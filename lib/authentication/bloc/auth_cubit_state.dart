import 'package:hw_mobiledevelopment_moneycontrol/authentication/domain/entities/auth_error.dart';

class AuthCubitState {
  final AuthError userState;
  final String? inputtedEmail;
  final String? inputtedPassword;

  const AuthCubitState(
      {required this.userState, this.inputtedEmail, this.inputtedPassword});

  AuthCubitState copyWith(
          {AuthError? userState, String? email, String? password}) =>
      AuthCubitState(
          userState: userState ?? this.userState,
          inputtedEmail: email ?? inputtedEmail,
          inputtedPassword: password ?? inputtedPassword);
}
