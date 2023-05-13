import 'package:firebase_auth/firebase_auth.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/domain/entities/auth_error.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/domain/use_cases/authenticate_user.dart';

class RemoteAuthenticateUser extends AuthenticateUser {
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AuthError> authenticateUser(String userName, String password) async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(email: userName, password: password)
          .then((value) => {
                print("Everything is OK"),
                // FirebaseAuth.instance.authStateChanges().listen((User? user) {
                //   if (user == null) {
                //     print('User is currently signed out!');
                //   } else {
                //     print('User is signed in!');
                //   }
                // })
              });
      return AuthError(
          errorCode: "000", errorMessage: "User was authenticated");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return AuthError(
            errorCode: e.code,
            errorMessage: e.message ?? "Ops! Something went wrong");
      } else if (e.code == 'wrong-password') {
        return AuthError(
            errorCode: e.code,
            errorMessage: e.message ?? "Ops! Something went wrong");
      } else {
        return AuthError(
            errorCode: e.code,
            errorMessage: e.message ?? "Ops! Something went wrong");
      }
    }
  }

  // @override
  // Future<AuthError> createUser(String userName, String password) {
  //   firebaseAuth
  //       .createUserWithEmailAndPassword(email: userName, password: password)
  //       .then((value) =>
  //           {AuthEntity(null, userName: userName, password: password)})
  //       .onError((error, stackTrace) => {
  //             AuthEntity(error as AuthError?,
  //                 userName: userName, password: password)
  //           });
  //   throw Exception("Something went wrong");
  // }
}
