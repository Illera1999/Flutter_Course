import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameError { empty, length}

// Extend FormzInput and provide the input type and error type.
class Username extends FormzInput<String, UsernameError> {
  // Call super.pure to represent an unmodified form input.
  const Username.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Username.dirty({String value = ''}) : super.dirty(value);

  String? get errorMessage {
    if ( isValid || isPure) return null;
    switch (displayError) {
      case UsernameError.empty:
        return 'El nombre de usuario no puede estar vacío';
      case UsernameError.length:
        return 'El nombre de usuario debe tener al menos 6 caracteres';
      default:
        return null; // No error
    }
  }

  // Override validator to handle validating a given input value.
  @override
  UsernameError? validator(String value) {
    if(value.isEmpty || value.trim().isEmpty) {
      return UsernameError.empty;
    }
    if(value.length < 6) {
      return UsernameError.length;
    }
    return null; // No error
  }
}
