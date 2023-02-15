import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stream/app/data/services/remote/authentication_api.dart';
import 'package:stream/app/domain/either.dart';
import 'package:stream/app/domain/models/enums.dart';
import 'package:stream/app/domain/models/user.dart';
import 'package:stream/app/domain/repositories/authentication_repository.dart';

const _key = 'sessionId';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FlutterSecureStorage _secureStorage;

  final AuthenticationAPI _authenticationAPI;

  AuthenticationRepositoryImpl(this._secureStorage, this._authenticationAPI);

  @override
  Future<User?> getUserData() {
    return Future.value(User());
  }

  @override
  Future<bool> get isSignedIn async {
    final sessionId = await _secureStorage.read(key: _key);
    return sessionId != null;
  }

  @override
  Future<Either<SignFailure, User>> signIn(
    String username,
    String password,
  ) async {
    //TODO;
    await _authenticationAPI.createRequestToken();
    await Future.delayed(const Duration(seconds: 6));
    if (username != 'test') {
      return Either.left(SignFailure.notFound);
    }
    if (password != '123456') {
      return Either.left(SignFailure.unauthorized);
    }
    return Either.right(
      User(),
    );
  }
}
