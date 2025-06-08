part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }


class RegisterFormState extends Equatable {

  final Username username;
  final bool isValid;
  final Email email;
  final Password password;
  final FormStatus status;

  const RegisterFormState({
    this.username = const Username.pure(),
    this.isValid = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormStatus.invalid,
  });

  RegisterFormState copyWith({
    Username? username,
    bool? isValid,
    Email? email,
    Password? password,
    FormStatus? status,
  }) {
    return RegisterFormState(
      username: username ?? this.username,
      isValid: isValid ?? this.isValid,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [username, isValid, email, password, status];
}
