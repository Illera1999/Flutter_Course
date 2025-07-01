import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:teslo_shop/features/auth/presentation/providers/auth_provider.dart';
import 'package:teslo_shop/features/shared/shared.dart';



//! 3- StateotifierProvider - consume afuera
final loginFormProvider = StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref) {
  final loginUserCallback = ref.watch(authProvider.notifier).loginUser;
  return LoginFormNotifier(loginUserCallback: loginUserCallback);
});

//! 2- Como implementamos un notifier
class LoginFormNotifier extends StateNotifier<LoginFormState> {
  final Function(String, String) loginUserCallback;
  LoginFormNotifier({
    required this.loginUserCallback,
  }): super(LoginFormState());

  void onEmailChanged(String value) {
    final email = Email.dirty(value);
    state = state.copyWith(
      email: email,
      isValid: Formz.validate([
        email,
        state.password,
      ]),
    );
  }
  void onPasswordChanged(String value) {
    final password = Password.dirty(value);
    state = state.copyWith(
      password: password,
      isValid: Formz.validate([
        state.email,
        password,
      ]),
    );
  }

  void onFormSubmit() async{
    _touchEveryField();
    if ( !state.isValid ) return;
    print(state);
    await loginUserCallback(
      state.email.value,
      state.password.value,
    );
  }
  void _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    
    state = state.copyWith(
      isFormposted: true,
      email: email,
      password: password,
      isValid: Formz.validate([
        email,
        password,
      ]),
    );
  }
  
}

//! 1- State del procider
class LoginFormState {
  final bool isPosting;
  final bool isFormposted;
  final bool isValid;
  final Email email;
  final Password password;

  LoginFormState({
    this.isPosting = false,
    this.isFormposted = false,
    this.isValid = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  LoginFormState copyWith({
    bool? isPosting,
    bool? isFormposted,
    bool? isValid,
    Email? email,
    Password? password,
  }) {
    return LoginFormState(
      isPosting: isPosting ?? this.isPosting,
      isFormposted: isFormposted ?? this.isFormposted,
      isValid: isValid ?? this.isValid,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return '''
      LoginFormState(
        isPosting: $isPosting,
        isFormposted: $isFormposted,
        isValid: $isValid,
        email: $email,
        password: $password
      )''';
  }
}



