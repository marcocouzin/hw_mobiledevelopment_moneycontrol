import 'package:flutter/material.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/ui/authentication/auth_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatelessWidget {
  static const String id = '/splash_screen';

  final Future<bool> isAuthenticated;

  const SplashScreen({super.key, required this.isAuthenticated});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: LoadingAnimationWidget.discreteCircle(
              color: Colors.blue, size: 100)
        ),
      ),
    );
  }

  void goHome(BuildContext context) {
    Navigator.pushNamed(
      context,
      AuthScreen.id,
    ); //
  }

}
