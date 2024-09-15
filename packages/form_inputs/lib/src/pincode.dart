import 'package:formz/formz.dart';

// Define input validation errors
enum PincodeError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Pincode extends FormzInput<String, PincodeError> {
  // Call super.pure to represent an unmodified form input.
  const Pincode.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Pincode.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  PincodeError? validator(String value) {
    if (value.isEmpty) {
      return PincodeError.empty;
    } else if (value.length != 6) {
      return PincodeError.length;
    }
    return null;
  }
}
