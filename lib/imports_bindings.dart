//*================[ app sources ]=============================//

export 'core/core.dart';
export 'src/src.dart';

//*================[ internal packages  ]=============================//

export 'dart:async';
export 'dart:convert';
export 'dart:io';
export 'dart:math';

//*================[ external packages ]=============================//

export 'package:bloc/bloc.dart';
export 'package:dio/dio.dart' show Dio, DioException, FormData, MultipartFile, Options;
export 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform, kIsWeb;
export 'package:flutter/foundation.dart';
export 'package:flutter/material.dart';
export 'package:flutter/rendering.dart';
export 'package:flutter/services.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:formz/formz.dart';
export 'package:font_awesome_flutter/font_awesome_flutter.dart';
export 'package:equatable/equatable.dart';
export 'package:flow_builder/flow_builder.dart';
export 'package:path_provider/path_provider.dart';
export 'package:image_picker/image_picker.dart';
export 'package:fpdart/fpdart.dart' show Either, None, Option, Some, left, none, right, some;

//*================[ mono repos ]=============================//

export 'package:authentication_repository/authentication_repository.dart';
export 'package:form_inputs/form_inputs.dart';
export 'package:users_repository/users_repository.dart';
