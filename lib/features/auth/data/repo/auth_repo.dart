import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<String, Unit>> signIn({
    required String email,
    required String password,
  });
  Future<Either<String, void>> register({
    required String email,
    required String password,
  });
}
