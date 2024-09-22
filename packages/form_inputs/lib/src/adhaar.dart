import 'package:formz/formz.dart';

// Define input validation errors
enum AdhaarError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Adhaar extends FormzInput<String, AdhaarError> {
  // Call super.pure to represent an unmodified form input.
  const Adhaar.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Adhaar.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  AdhaarError? validator(String value) {
    if (value.isEmpty) {
      return AdhaarError.empty;
    } else if (value.length != 12) {
      return AdhaarError.length;
    }
    return null;
  }
}
