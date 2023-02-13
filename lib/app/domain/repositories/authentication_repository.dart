import 'package:stream/app/domain/either.dart';
import 'package:stream/app/domain/models/enums.dart';
import 'package:stream/app/domain/models/user.dart';

abstract class AuthenticationRepository {
  Future<bool> get isSignedIn;
  Future<User?> getUserData();
  Future<Either<SignFailure, User>> signIn(
    String username,
    String password,
  );
}
