import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/auth/domain/domain.dart';
import 'package:teslo_shop/features/auth/infrastructure/infrastructure.dart';
import 'package:teslo_shop/features/shared/infrastructure/services/key_value_storage_service.dart';
import 'package:teslo_shop/features/shared/infrastructure/services/key_value_storage_service_impl.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoriesImpl();
  final KeyValueStorageService keyValueStoregeService =
      KeyValueStorageServiceImpl();
  return AuthNotifier(
    authRepository: authRepository,
    keyValueStoregeService: keyValueStoregeService,
  );
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepositoriesImpl authRepository;
  final KeyValueStorageService keyValueStoregeService;
  AuthNotifier({
    required this.authRepository,
    required this.keyValueStoregeService,
  }) : super(AuthState()){
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    final token = await keyValueStoregeService.getKeyValue<String>(key: 'token');
    if (token == null ) return logout();
    try {
      final user = await authRepository.checkAuthStatus(token);
      _setLoggedUser(user);
    } catch (e) {
      return logout();
    }
  }

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout('Error no controlado');
    }
  }

  Future<void> registerUser(
      String email, String password, String fullName) async {}

  void _setLoggedUser(User user) async {
    await keyValueStoregeService.setKeyValue(key: 'token', value: user.token);
    state = state.copyWith(
      authStatus: AuthStatus.authenticated,
      user: user,
    );
  }

  Future<void> logout([String? errorMessage]) async {
    await keyValueStoregeService.removeKey('token');
    // TODO: limpiar el token.
    state = state.copyWith(
      authStatus: AuthStatus.notAuthenticated,
      user: null,
      errorMessage: errorMessage,
    );
  }
}

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState({
    this.authStatus = AuthStatus.checking,
    this.user,
    this.errorMessage = '',
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    String? errorMessage,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
