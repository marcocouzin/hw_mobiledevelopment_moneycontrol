import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/bloc/auth_cubit.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/bloc/auth_cubit_state.dart';

import '../../../bills/ui/expenses_screen.dart';
import 'create_account_screen.dart';

class CreateAccountContainer extends BlocBuilder<AuthCubit, AuthCubitState> {
  CreateAccountContainer({super.key})
      : super(builder: (context, state) {
          return CreateAccountScreen(
              inputtedEmail: state.inputtedEmail,
              inputtedPassword: state.inputtedPassword,
              inputtedConfirmPassword: state.inputtedConfirmPassword,
              onEmailChanged: (String value) {
                AuthCubitProvider.of(context).updateEmailValue(value);
              },
              onPasswordChanged: (String value) {
                AuthCubitProvider.of(context).updatePasswordValue(value);
              },
              onConfirmPasswordChanged: (String value) {
                AuthCubitProvider.of(context).updateConfirmPasswordValue(value);
              },
              onCreatePressed: () {
                if (state.inputtedEmail?.isEmpty ?? true) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('The field email is required'),
                      backgroundColor: Colors.red));
                } else if (state.inputtedPassword?.isEmpty ?? true) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('The field Password is required'),
                      backgroundColor: Colors.red));
                } else if (state.inputtedConfirmPassword?.isEmpty ?? true) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('The field Confirm Password is required'),
                      backgroundColor: Colors.red));
                } else if (state.inputtedPassword !=
                    state.inputtedConfirmPassword) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Password and confirmation do not match'),
                      backgroundColor: Colors.red));
                } else {
                  AuthCubitProvider.of(context).createUser();

                  if (state.userState.errorCode == '000') {
                    Navigator.pushNamed(context, ExpensesScreen.id,
                        arguments:
                            ExpensesScreenArguments(state.inputtedEmail ?? ''));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.userState.errorMessage),
                      ),
                    );
                  }
                }
              });
        });
}
