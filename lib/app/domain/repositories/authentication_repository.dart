import 'package:stream/app/domain/models/user.dart';

abstract class AuthenticationRepository {
  Future<bool> get isSignedIn;
  Future<User?> getUserData();
}
