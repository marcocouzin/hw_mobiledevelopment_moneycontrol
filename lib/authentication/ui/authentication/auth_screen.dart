import 'package:flutter/material.dart';

import '../../../widgets/rounded_button.dart';
import '../../../widgets/rounded_text_field.dart';
import '../account/create_account_screen.dart';

class AuthScreen extends StatelessWidget {
  static const String id = '/auth_screen';

  final String? inputtedEmail;
  final String? inputtedPassword;

  final Function(String value) onEmailChanged;
  final Function(String value) onPasswordChanged;
  final Function() onAuthenticatePressed;

  const AuthScreen({
    super.key,
    required this.onEmailChanged,
    required this.inputtedEmail,
    required this.inputtedPassword,
    required this.onPasswordChanged,
    required this.onAuthenticatePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        // On the onFocus action, restore the initial fields state
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              //  Use SingleChildScrollView when you need a scroll
              // For example if you have many field on the screen
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedTextField(
                      label: 'Insert your email',
                      textInputType: TextInputType.emailAddress,
                      onTextChange: (text) => {onEmailChanged(text)},
                    ),
                    const SizedBox(height: 10),
                    RoundedTextField(
                      label: 'Insert your password',
                      obscureText: true,
                      onTextChange: (text) => {onPasswordChanged(text)},
                    ),
                    const SizedBox(height: 70),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, CreateAccountScreen.id);
                              },
                              child: Container(
                                alignment: AlignmentDirectional.center,
                                child: const Text(
                                  'Create Account',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue),
                                ),
                              )),
                          // const SizedBox(width: 150),
                          Container(
                            width: 120,
                          ),
                          Expanded(
                            child: RoundedButton(
                                text: 'Login',
                                onPressed: onAuthenticatePressed),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
