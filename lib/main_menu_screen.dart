import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  static const String id = 'menu_screen';

  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Main Menu',
                style: TextStyle(
                  fontSize: 32
                ),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}