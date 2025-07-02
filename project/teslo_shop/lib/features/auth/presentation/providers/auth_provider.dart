import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/auth/domain/domain.dart';
import 'package:teslo_shop/features/auth/infrastructure/infrastructure.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoriesImpl();
  return AuthNotifier(authRepository: authRepository); });

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepositoriesImpl authRepository;
  AuthNotifier({required this.authRepository}) : super(AuthState());

  Future<void> checkAuthStatus() async {}

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

  void _setLoggedUser(User user) {
    // TODO; necesito guardar el token en el local storage}
    state = state.copyWith(
      authStatus: AuthStatus.authenticated,
      user: user,
    );
  }

  Future<void> logout([String? errorMessage]) async {
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
