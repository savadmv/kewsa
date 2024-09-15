import 'package:kewsa/imports_bindings.dart';

///
@immutable
class FileServices {
  ///* This constructor body for creating singleton widget
  factory FileServices() {
    return _pickFiles ??= FileServices._(ImagePicker());
  }

  //* This named constructor for create object for this class
  const FileServices._(this._picker);

  //* This variable for store this class object globally
  static FileServices? _pickFiles;

  ///*
  final ImagePicker _picker;

  ///*
  Future<XFile?> pickImage(ImageSource source) async {
    final result = await _picker.pickImage(source: source);
    if (result != null) {
      return result;
    }
    return null;
  }
}
