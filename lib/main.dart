import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/bloc/auth_cubit.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/ui/authentication/auth_container.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/ui/splashscreen/splash_container.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/ui/splashscreen/splash_screen.dart';
import 'package:hw_mobiledevelopment_moneycontrol/bills/ui/expenses_screen.dart';

import 'authentication/ui/account/create_account_container.dart';
import 'authentication/ui/account/create_account_screen.dart';
import 'authentication/ui/authentication/auth_screen.dart';
import 'bills/bloc/expenses_cubit.dart';
import 'bills/ui/expenses_container.dart';
import 'firebase_options.dart';

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
      initialRoute: ExpensesScreen.id,
      routes: {
        AuthScreen.id: (context) => AuthCubitProvider(child: AuthContainer()),
        SplashScreen.id: (context) =>
            AuthCubitProvider(child: SplashContainer()),
        CreateAccountScreen.id: (context) =>
            AuthCubitProvider(child: CreateAccountContainer()),
        ExpensesScreen.id: (context) =>
            ExpensesCubitProvider(child: ExpensesContainer()),
      },
    );
  }
}
