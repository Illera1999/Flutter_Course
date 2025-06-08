import 'package:formz/formz.dart';

// Define input validation errors
enum EmailError { empty, format }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {
  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Email.dirty({String value = ''}) : super.dirty(value);

  static final RegExp emailRegexPattern = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  String? get errorMessage {
    if (isValid || isPure) return null;
    switch (displayError) {
      case EmailError.empty:
        return 'El email no puede estar vacío';
      case EmailError.format:
        return 'No tiene un formato de correo electrónico válido';
      default:
        return null; // No error
    }
  }

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return EmailError.empty;
    }
    if (emailRegexPattern.hasMatch(value)) {
      return EmailError.format;
    }

    return null; // No error
  }
}
