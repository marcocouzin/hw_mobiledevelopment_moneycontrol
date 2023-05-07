import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main_menu_screen.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/rounded_text_field.dart';

class AuthScreen extends StatefulWidget {
  static const String id = '/auth_screen';


  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var inputtedEmail = '';

  var inputtedPassword = '';

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
                      onTextChange: (text) {
                        inputtedEmail = text;
                      },
                    ),
                    const SizedBox(height: 30),
                    RoundedTextField(
                      label: 'Insert your password',
                      obscureText: true,
                      onTextChange: (text) {
                        inputtedPassword = text;
                      },
                    ),
                    const SizedBox(height: 64),
                    RoundedButton(
                        text: 'Login',
                        onPressed: () {
                          authenticateUser(context);
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void authenticateUser(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;

    firebaseAuth
        .signInWithEmailAndPassword(
        email: inputtedEmail, password: inputtedPassword)
        .then((userCredentials) {
      Navigator.pushReplacementNamed(context, MainMenuScreen.id);
      // Implement the exception flow
    }).onError((error, stackTrace) {
      firebaseAuth
          .createUserWithEmailAndPassword(
          email: inputtedEmail, password: inputtedPassword)
          .then((userCredentials) {
        Navigator.pushReplacementNamed(context, MainMenuScreen.id);
        // Implement the exception flow
      }).onError((FirebaseAuthException error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              error.message ?? 'Ops! Something went wrong',
            ),
          ),
        );
      });
    });
  }
}
