import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/core/helper/add_user_to_cloud_firestore.dart';

import 'package:spotify_app/features/auth/data/repo/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  @override
  Future<Either<String, Unit>> register(
      {required String email,
      required String password,
      required String name}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      addUserToCloudFireStore(name, email);

      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left("Weak Password");
      } else if (e.code == 'email-already-in-use') {
        return left("Email Already Existed");
      } else {
        return left("There is an error,Try later");
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> signIn(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'unknown-error') {
        return left("Invalid Email Or Password");
      } else {
        return left(e.code);
      }
    }
  }
}
