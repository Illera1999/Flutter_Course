import 'package:teslo_shop/features/auth/domain/domain.dart';
import 'package:teslo_shop/features/auth/infrastructure/infrastructure.dart';

class AuthRepositoriesImpl extends AuthRepository {
  final AuthDatasource authDatasource;
  AuthRepositoriesImpl({
    AuthDatasource? authDatasource,
  }) : authDatasource = authDatasource ?? AuthDatasourceImpl();

  @override
  Future<User> checkAuthStatus(String token) {
    return authDatasource.checkAuthStatus(token);
  }

  @override
  Future<User> login(String email, String password) {
    return authDatasource.login(email, password);
  }

  @override
  Future<User> register(String email, String password, String fullName) {
    return authDatasource.register(email, password, fullName);
  }
}
