import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/bloc/auth_cubit_state.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/domain/entities/auth_entity.dart';

import '../data/use_cases/remote_authenticate_user.dart';
import '../domain/use_cases/authenticate_user.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthenticateUser user;

  AuthCubit(super.initialState, {required this.user});

  void updateEmailValue(String value) {
    emit(state.copyWith(email: value));
  }

  void updatePasswordValue(String value) {
    emit(state.copyWith(password: value));
  }

  Future<void> authenticator() async {
    // AuthEntity authEntity = await user.authenticateUser(state.inputtedEmail, state.inputtedPassword);
    await user.authenticateUser(state.inputtedEmail, state.inputtedPassword);
    // emit(state.copyWith(userState: authEntity));
  }
}


class AuthCubitProvider extends BlocProvider<AuthCubit> {
  AuthCubitProvider({super.key, Widget? child})
      : super(
            create: (context) => AuthCubit(
                AuthCubitState(
                    userState: AuthEntity(null, userName: '', password: '')),
                user: RemoteAuthenticateUser()),
            child: child);

  static AuthCubit of(BuildContext context) => BlocProvider.of(context);
}
