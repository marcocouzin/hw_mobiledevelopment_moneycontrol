import 'package:flutter/material.dart';

import 'authentication/ui/auth_screen.dart';
import 'main_menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // home: const AuthScreen(),
      initialRoute: AuthScreen.id,
      routes: {
        AuthScreen.id: (context) => const AuthScreen(),
        MainMenuScreen.id: (context) => const MainMenuScreen(),
      },
    );
  }
}


