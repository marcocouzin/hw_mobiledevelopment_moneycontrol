import '../domain/entities/auth_entity.dart';

class AuthCubitState {
  final AuthEntity? userState;
  final String? inputtedEmail;
  final String? inputtedPassword;

  const AuthCubitState({this.userState, this.inputtedEmail, this.inputtedPassword});

  AuthCubitState copyWith({
    AuthEntity? userState,
    String? email,
    String? password}) =>
      AuthCubitState(
          userState: userState ?? this.userState,
          inputtedEmail: email ?? inputtedEmail,
          inputtedPassword: password ?? inputtedPassword
      );
}
