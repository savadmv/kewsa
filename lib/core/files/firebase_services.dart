import 'package:kewsa/imports_bindings.dart';

///
class FirebaseServices {
  ///* This constructor body for creating singleton widget
  factory FirebaseServices() {
    return _firebaseServices ??= FirebaseServices._();
  }

  //* This named constructor for create object for this class
  FirebaseServices._();

  //* This variable for store this class object globally
  static FirebaseServices? _firebaseServices;

  ///*
  Directory? tempDir;

  ///*
  Future<String> getFile(String path, {int maxMb = 1}) async {
    try {
      tempDir ??= await getTemporaryDirectory();
      final fileDestination = '${tempDir?.path}/$path';
      if (!File(fileDestination).existsSync()) {
        final bytes = await UsersRepository().getFile(path, maxMb: maxMb);
        if (bytes != null) {
          await File(fileDestination).create(recursive: true);
          await File(fileDestination).writeAsBytes(bytes);
        } else {
          throw Exception("can't get video right row.Please try again later");
        }
      }
      return fileDestination;
    } catch (err) {
      write('get video error is : $err');
    }
    throw Exception("can't get video right  row.Please try again later");
  }
}
