import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/bloc/auth_cubit.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/bloc/auth_cubit_state.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/ui/auth_screen.dart';

class AuthContainer extends BlocBuilder<AuthCubit, AuthCubitState> {
  AuthContainer({super.key})
      : super(builder: (context, state) {
          return AuthScreen(
              inputtedEmail: state.inputtedEmail,
              inputtedPassword: state.inputtedPassword,
              onEmailChanged: (String value) {
                AuthCubitProvider.of(context).updateEmailValue(value);
              },
              onPasswordChanged: (String value) {
                AuthCubitProvider.of(context).updatePasswordValue(value);
              },
              onAuthenticatePressed: () {
                AuthCubitProvider.of(context).authenticator();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "${state.userState.errorCode} - "
                      "${state.userState.errorMessage}",
                    ),
                  ),
                );
              });
        });
}
