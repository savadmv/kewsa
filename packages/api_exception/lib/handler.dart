import 'package:api_exception/app_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

///*This class will handle BaseRepo error
@immutable
abstract class ApiExceptionHandler {
  ///*Handle errors based on each Exception
  static Future<ApiException> handle(
    dynamic e, {
    ApiException? Function(Exception e)? customHandler,
  }) async {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'invalid-email':
          return const ApiException.notFound(
            msg: 'Email is not valid or badly formatted.',
          );
        case 'user-disabled':
          return const ApiException.notFound(
            msg: 'This user has been disabled. Please contact support for help.',
          );
        case 'user-not-found':
          return const ApiException.notFound(
            msg: 'Email is not found, please create an account.',
          );
        case 'wrong-password':
          return const ApiException.notFound(
            msg: 'Incorrect password, please try again.',
          );
        case 'account-exists-with-different-credential':
          return const ApiException.notFound(
            msg: 'Account exists with different credentials.',
          );
        case 'invalid-credential':
          return const ApiException.notFound(
            msg: 'The credential received is malformed or has expired.',
          );
        case 'operation-not-allowed':
          return const ApiException.notFound(
            msg: 'Operation is not allowed.  Please contact support.',
          );
        case 'invalid-verification-code':
          return const ApiException.notFound(
            msg: 'The credential verification code received is invalid.',
          );
        case 'invalid-verification-id':
          return const ApiException.notFound(
            msg: 'The credential verification ID received is invalid.',
          );
        case 'email-already-in-use':
          return const ApiException.notFound(
            msg: 'An account already exists for that email.',
          );
        case 'weak-password':
          return const ApiException.notFound(
            msg: 'Please enter a stronger password.',
          );
      }
    }

    // Firestore Exception Handling
    if (e is FirebaseException) {
      switch (e.code) {
        case 'cancelled':
          return const ApiException.server(
            msg: 'Operation was cancelled.',
          );
        case 'unknown':
          return const ApiException.unknown(
            msg: 'An unknown error occurred. Please try again.',
          );
        case 'invalid-argument':
          return const ApiException.notFound(
            msg: 'Invalid arguments provided.',
          );
        case 'deadline-exceeded':
          return const ApiException.server(
            msg: 'Operation took too long to complete. Please try again.',
          );
        case 'not-found':
          return const ApiException.notFound(
            msg: 'Document not found.',
          );
        case 'already-exists':
          return const ApiException.notFound(
            msg: 'Document already exists.',
          );
        case 'permission-denied':
          return const ApiException.notFound(
            msg: 'Permission denied. Please check your access rights.',
          );
        case 'resource-exhausted':
          return const ApiException.server(
            msg: 'Resource exhausted. Please try again later.',
          );
        case 'failed-precondition':
          return const ApiException.notFound(
            msg: 'Operation is not allowed in the current state.',
          );
        case 'aborted':
          return const ApiException.server(
            msg: 'Operation was aborted.',
          );
        case 'out-of-range':
          return const ApiException.notFound(
            msg: 'Operation was out of range.',
          );
        case 'unimplemented':
          return const ApiException.server(
            msg: 'Operation is not implemented.',
          );
        case 'internal':
          return const ApiException.server(
            msg: 'Internal server error occurred.',
          );
        case 'unavailable':
          return const ApiException.server(
            msg: 'Service is currently unavailable.',
          );
        case 'data-loss':
          return const ApiException.server(
            msg: 'Unrecoverable data loss occurred.',
          );
        case 'unauthenticated':
          return const ApiException.notFound(
            msg: 'User is unauthenticated.',
          );
      }
    }

    // Firebase Storage Exception Handling
    if (e is FirebaseException && e.plugin == 'firebase_storage') {
      switch (e.code) {
        case 'object-not-found':
          return const ApiException.notFound(
            msg: 'File not found in storage.',
          );
        case 'notFound':
          return const ApiException.notFound(
            msg: 'User does not have permission to access the file.',
          );
        case 'cancelled':
          return const ApiException.server(
            msg: 'File upload/download was cancelled.',
          );
        case 'unknown':
          return const ApiException.unknown(
            msg: 'An unknown error occurred during file operation.',
          );
      }
    }

    if (e.toString().contains('SocketException')) {
      ///* Handling header issue
      if (await InternetConnectionChecker().hasConnection) {
        return const ApiException.server();
      } else {
        return const ApiException.network();
      }
    }

    return const ApiException.unknown();
  }
}
