import 'package:formz/formz.dart';

// Define input validation errors
enum FormTextError { empty }

// Extend FormzInput and provide the input type and error type.
class FormText extends FormzInput<String, FormTextError> {
  // Call super.pure to represent an unmodified form input.
  const FormText.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const FormText.dirty([String? value]) : super.dirty(value ?? '');

  // Override validator to handle validating a given input value.
  @override
  FormTextError? validator(String value) {
    return value.isEmpty ? FormTextError.empty : null;
  }
}
