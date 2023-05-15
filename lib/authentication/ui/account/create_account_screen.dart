import 'package:flutter/material.dart';

import '../../../widgets/rounded_button.dart';
import '../../../widgets/rounded_text_field.dart';

class CreateAccountScreen extends StatelessWidget {
  static const String id = '/create_account_screen';

  final String? inputtedEmail;
  final String? inputtedPassword;
  final String? inputtedConfirmPassword;

  final Function(String value) onEmailChanged;
  final Function(String value) onPasswordChanged;
  final Function(String value) onConfirmPasswordChanged;
  final Function() onCreatePressed;

  const CreateAccountScreen(
      {super.key,
      this.inputtedEmail = "",
      this.inputtedPassword = "",
      this.inputtedConfirmPassword,
      required this.onEmailChanged,
      required this.onPasswordChanged,
      required this.onCreatePressed,
      required this.onConfirmPasswordChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Colors.transparent,
        title: const Text('Create your account'),
      ),
      body: SafeArea(
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
                  const SizedBox(height: 10),
                  RoundedTextField(
                    label: 'Confirm your password',
                    obscureText: true,
                    onTextChange: (text) => {onConfirmPasswordChanged(text)},
                  ),
                  const SizedBox(height: 64),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 200,
                        ),
                        Expanded(
                          child: RoundedButton(
                              text: 'Create',
                              onPressed: onCreatePressed
                          ),
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
    );
  }
}
