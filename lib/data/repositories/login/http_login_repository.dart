import 'dart:io';
import 'package:clean_architecture/domain/entities/user_entity.dart';
import 'package:clean_architecture/domain/repositories/abstract_login_repository.dart';

class HttpLoginRepository extends AbstractLoginRepository {
  final HttpClient? client;

  HttpLoginRepository({
    this.client,
  });

  @override
  Future<UserEntity> doLogin({
    required String username,
    required String password,
  }) async {
    final response = await client?.post('url', 80, '/login');
    print(response);
    return UserEntity(
      username: username,
      name: 'name',
      email: 'email',
      phone: 'phone',
    );
  }

  @override
  Future<void> doLogout() {
    final response = client?.post('url', 80, '/logout');
    print(response);
    throw NullThrownError();
  }
}
