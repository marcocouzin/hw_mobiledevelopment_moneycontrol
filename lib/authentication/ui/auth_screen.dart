import 'package:flutter/material.dart';

import '../../widgets/rounded_button.dart';
import '../../widgets/rounded_text_field.dart';

class AuthScreen extends StatelessWidget {
  static const String id = '/auth_screen';

  final String? inputtedEmail;
  final String? inputtedPassword;

  final Function(String value) onEmailChanged;
  final Function(String value) onPasswordChanged;
  final Function() onAuthenticatePressed;

  const AuthScreen(
      {super.key,
      required this.onEmailChanged,
      required this.inputtedEmail,
      required this.inputtedPassword,
      required this.onAuthenticatePressed,
      required this.onPasswordChanged});

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
                    const SizedBox(height: 30),
                    RoundedTextField(
                      label: 'Insert your password',
                      obscureText: true,
                      onTextChange: (text) => {onPasswordChanged(text)},
                    ),
                    const SizedBox(height: 64),
                    RoundedButton(
                        text: 'Login', onPressed: onAuthenticatePressed),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
//
// void authenticateUser(BuildContext context) {
//   final firebaseAuth = FirebaseAuth.instance;
//
//   firebaseAuth
//       .signInWithEmailAndPassword(
//       email: inputtedEmail, password: inputtedPassword)
//       .then((userCredentials) {
//     Navigator.pushReplacementNamed(context, MainMenuScreen.id);
//     // Implement the exception flow
//   }).onError((error, stackTrace) {
//     firebaseAuth
//         .createUserWithEmailAndPassword(
//         email: inputtedEmail, password: inputtedPassword)
//         .then((userCredentials) {
//       Navigator.pushReplacementNamed(context, MainMenuScreen.id);
//       // Implement the exception flow
//     }).onError((FirebaseAuthException error, stackTrace) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//             error.message ?? 'Ops! Something went wrong',
//           ),
//         ),
//       );
//     });
//   });
// }
}
