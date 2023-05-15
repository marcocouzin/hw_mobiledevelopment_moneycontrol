import 'package:hw_mobiledevelopment_moneycontrol/authentication/domain/entities/auth_error.dart';

class AuthCubitState {
  final AuthError userState;
  final String? inputtedEmail;
  final String? inputtedPassword;
  final String? inputtedConfirmPassword;

  const AuthCubitState(
      {required this.userState,
      this.inputtedEmail,
      this.inputtedPassword,
      this.inputtedConfirmPassword});

  AuthCubitState copyWith(
          {AuthError? userState,
          String? email,
          String? password,
          String? confirmPassword}) =>
      AuthCubitState(
          userState: userState ?? this.userState,
          inputtedEmail: email ?? inputtedEmail,
          inputtedPassword: password ?? inputtedPassword,
          inputtedConfirmPassword: confirmPassword ?? inputtedConfirmPassword);
}
