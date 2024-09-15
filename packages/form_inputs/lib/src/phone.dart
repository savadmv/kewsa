import 'package:formz/formz.dart';

// Define input validation errors
enum PhoneError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Phone extends FormzInput<String, PhoneError> {
  // Call super.pure to represent an unmodified form input.
  const Phone.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Phone.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  PhoneError? validator(String value) {
    if (value.isEmpty) {
      return PhoneError.empty;
    } else if (value.length != 10) {
      return PhoneError.length;
    }
    return null;
  }
}
