import 'dart:async';
import 'dart:io';

import 'package:api_exception/api_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:users_repository/users_repository.dart';

/// {@template users_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
class UsersRepository {
  /// {@macro users_repository}
  factory UsersRepository({
    FirebaseFirestore? firestore,
    FirebaseStorage? storage,
  }) {
    return _instance ??= UsersRepository._(
      firestore: firestore,
    );
  }

  UsersRepository._({
    FirebaseFirestore? firestore,
    FirebaseStorage? storage,
  })  : _firestore = (firestore ?? FirebaseFirestore.instance)
          ..settings = const Settings(
            persistenceEnabled: true,
          ),
        _storage = storage ?? FirebaseStorage.instance;

  ///Singleton instance
  static UsersRepository? _instance;

  ///
  late final FirebaseFirestore _firestore;

  ///
  late final FirebaseStorage _storage;

  /// Users Collection
  late final _usersCollection = _firestore.collection('users');

  /// Users Collection
  late final _usersDetailsCollection = _firestore.collection('users_details');

  /// Unit Names Collection
  late final _unitNamesCollection = _firestore.collection('unit_names');

  // Create a new user
  Future<void> createUser({required UserEntity user}) async {
    try {
      String? photoUrl;
      if (user.photoUrl != null) {
        photoUrl = await uploadFile(path: user.photoUrl!);
      }
      final doc = await _usersCollection.add(
        UserEntity(
          name: user.name,
          email: user.email,
          photoUrl: photoUrl,
          kewsaMembershipNumber: user.kewsaMembershipNumber,
        ).createFirestore(),
      );
      await _usersDetailsCollection.doc(doc.id).set(user.copyWith(photoUrl: photoUrl).createFirestore());
    } catch (e) {
      throw await ApiExceptionHandler.handle(e);
    }
  }

  // Update a new user
  Future<void> updateUser({required String userId, required UserEntity user}) async {
    try {
      String? photoUrl;
      if (user.photoUrl != null) {
        photoUrl = await uploadFile(path: user.photoUrl!);
      }
      await _usersCollection.doc(userId).update(user.copyWith(photoUrl: photoUrl).updateFirestore());
      await _usersDetailsCollection.doc(userId).update(user.copyWith(photoUrl: photoUrl).updateFirestore());
    } catch (e) {
      throw await ApiExceptionHandler.handle(e);
    }
  }

  // Update a new user
  Future<void> deleteUser({required UserEntity user}) async {
    try {
      if (user.photoUrl != null) {
        await deleteFile(path: user.photoUrl!);
      }
      await _usersCollection.doc(user.id).delete();
      await _usersDetailsCollection.doc(user.id).delete();
    } catch (e) {
      throw await ApiExceptionHandler.handle(e);
    }
  }

  // Create a new user
  Future<void> newUnit({required UnitNameEntity unit}) async {
    try {
      await _unitNamesCollection.add(unit.toFirestore());
    } catch (e) {
      throw await ApiExceptionHandler.handle(e);
    }
  }

  // Fetch Single user by ID
  Stream<UserEntity> getUserById({required String ownerId}) {
    return _usersCollection.doc(ownerId).snapshots().asBroadcastStream().map(UserEntity.fromFirestore);
  } // Fetch Single user by ID

  // Fetch Single user by ID
  Stream<UserEntity> getUserDetailsById({required String userId}) {
    return _usersDetailsCollection.doc(userId).snapshots().asBroadcastStream().map(UserEntity.fromFirestore);
  }

  // Fetch all advertisements
  Stream<List<UserEntity>> get users => _usersCollection.snapshots().asBroadcastStream().map(
        (snapshot) => [...snapshot.docs.map(UserEntity.fromFirestore)],
      );

  // Fetch all advertisements
  Stream<List<UserEntity>> get usersDetails => _usersDetailsCollection.snapshots().asBroadcastStream().map(
        (snapshot) => [...snapshot.docs.map(UserEntity.fromFirestore)],
      );

  // Fetch all unitNames
  Stream<List<UnitNameEntity>> get unitNames => _unitNamesCollection.snapshots().asBroadcastStream().map(
        (snapshot) => [...snapshot.docs.map(UnitNameEntity.fromFirestore)],
      );

  //
  Future<Uint8List?> getFile(String path, {int maxMb = 100}) async {
    try {
      return _storage.ref().child(path).getData(1048576 * maxMb);
    } catch (e) {
      throw await ApiExceptionHandler.handle(e);
    }
  }

  //
  Future<String> uploadFile({
    required String path,
  }) async {
    try {
      final fileName = path.split('/').last;
      final timeInIso8601 = DateTime.now().toIso8601String();
      final assetRef = _storage.ref().child('ads/$timeInIso8601-$fileName');
      final taskSnapshot = await assetRef.putFile(File(path));
      return taskSnapshot.ref.fullPath;
    } catch (e) {
      throw await ApiExceptionHandler.handle(e);
    }
  }

  ///
  Future<void> deleteFile({
    required String path,
  }) async {
    try {
      final assetRef = _storage.ref().child(path);
      await assetRef.delete();
    } catch (e) {
      throw await ApiExceptionHandler.handle(e);
    }
  }
}
