// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

/// {@template form}
/// Advertisement Model
///
/// {@endtemplate}
@immutable
class UnitNameEntity extends Equatable {
  /// {@macro form}
  const UnitNameEntity({
    this.id,
    this.unitName,
  });

  /// The current question's id (unique id).
  final String? id;

  /// The current form's name (display name).
  final String? unitName;

  @override
  List<Object?> get props => [
        id,
        unitName,
      ];

  factory UnitNameEntity.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return UnitNameEntity(
      id: snapshot.id,
      unitName: data?['name'] as String?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (unitName != null) 'name': unitName,
    };
  }

  @override
  bool get stringify => true;

  UnitNameEntity copyWith({
    String? id,
    String? unitName,
  }) {
    return UnitNameEntity(
      id: id ?? this.id,
      unitName: unitName ?? this.unitName,
    );
  }
}
