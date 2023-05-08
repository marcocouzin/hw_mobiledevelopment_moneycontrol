import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/bloc/auth_cubit.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/ui/auth_container.dart';

import 'authentication/ui/auth_screen.dart';
import 'firebase_options.dart';
import 'main_menu_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
        AuthScreen.id: (context) => AuthCubitProvider(child: AuthContainer()),
        MainMenuScreen.id: (context) => const MainMenuScreen(),
      },
    );
  }
}


