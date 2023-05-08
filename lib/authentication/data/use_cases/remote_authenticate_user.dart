import 'package:firebase_auth/firebase_auth.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/domain/entities/auth_entity.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/domain/entities/auth_error.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/domain/use_cases/authenticate_user.dart';

class RemoteAuthenticateUser extends AuthenticateUser {
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> authenticateUser(
      String? userName, String? password) async {
    // firebaseAuth
    //     .signInWithEmailAndPassword(
    //         email: userName ?? "", password: password ?? "")
    //     .then((value) => {
    //           AuthEntity(null,
    //               userName: userName ?? "", password: password ?? "")
    //         })
    //     .onError((error, stackTrace) => {
    //           AuthEntity(error as AuthError?,
    //               userName: userName ?? "", password: password ?? "")
    //         });
    // throw Exception("Something went wrong");

    firebaseAuth
        .signInWithEmailAndPassword(
            email: userName ?? "", password: password ?? "")
        .then((userCredentials) {
      print("Everthing is good");
      // Implement the exception flow
    }).onError((error, stackTrace) {
      print(error.toString());
        // Implement the exception flow
      }).onError((FirebaseAuthException error, stackTrace) {
        print(error.message);
      });
  }

  @override
  Future<AuthEntity> createUser(String userName, String password) {
    firebaseAuth
        .createUserWithEmailAndPassword(email: userName, password: password)
        .then((value) =>
            {AuthEntity(null, userName: userName, password: password)})
        .onError((error, stackTrace) => {
              AuthEntity(error as AuthError?,
                  userName: userName, password: password)
            });
    throw Exception("Something went wrong");
  }
}
