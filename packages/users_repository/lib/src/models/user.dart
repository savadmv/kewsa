// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

/// {@template form}
/// Advertisement Model
///
/// {@endtemplate}
@immutable
class UserEntity extends Equatable {
  /// {@macro form}
  const UserEntity({
    this.id,
    this.email,
    this.name,
    this.address,
    this.pincode,
    this.phoneNumber,
    this.adhaarNumber,
    this.education,
    this.dateOfBirth,
    this.bloodGroup,
    this.panchayatOrMunicipality,
    this.nomineeName,
    this.nomineeAdharNumber,
    this.unitName,
    this.photoUrl,
    this.governmentPensionNumber,
    this.kewsaMembershipNumber,
    this.stateWelfareFundNumber,
    this.wiremenOrsupervisorNumber,
    this.cOrbOraOrclassLicenseNumber,
    this.createdAt,
    this.updatedAt,
  });

  /// The current question's id (unique id).
  final String? id;

  /// The current question's id (unique id).
  final String? email;

  /// The current form's email address.
  final String? name;

  /// The current form's name (display name).
  final String? address;

  /// The current form's name (display name).
  final String? pincode;

  /// The current form's name (display name).
  final String? phoneNumber;

  /// The current form's name (display name).
  final String? adhaarNumber;

  /// The current form's name (display name).
  final String? education;

  /// The current form's name (display name).
  final String? dateOfBirth;

  /// The current form's name (display name).
  final String? bloodGroup;

  /// The current form's name (display name).
  final String? panchayatOrMunicipality;

  /// The current form's name (display name).
  final String? nomineeName;

  /// The current form's name (display name).
  final String? nomineeAdharNumber;

  /// The current form's name (display name).
  final String? unitName;

  /// The current form's name (display name).
  final String? photoUrl;

  /// The current form's name (display name).
  final LabelValue? governmentPensionNumber;

  /// The current form's name (display name).
  final LabelValue? kewsaMembershipNumber;

  /// The current form's name (display name).
  final LabelValue? stateWelfareFundNumber;

  /// The current form's name (display name).
  final LabelValue? wiremenOrsupervisorNumber;

  /// The current form's name (display name).
  final LabelValue? cOrbOraOrclassLicenseNumber;

  /// The current form's name (display name).
  final Timestamp? createdAt;

  /// The current form's name (display name).
  final Timestamp? updatedAt;

  @override
  List<Object?> get props => [
        email,
        name,
        address,
        createdAt,
        updatedAt,
      ];

  factory UserEntity.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return UserEntity(
      id: snapshot.id,
      email: data?['email'] as String?,
      name: data?['name'] as String?,
      address: data?['address'] as String?,
      pincode: data?['pincode'] as String?,
      phoneNumber: data?['phone_number'] as String?,
      adhaarNumber: data?['adhaar_number'] as String?,
      education: data?['education'] as String?,
      dateOfBirth: data?['date_of_birth'] as String?,
      bloodGroup: data?['blood_group'] as String?,
      panchayatOrMunicipality: data?['panchayat_or_municipality'] as String?,
      nomineeName: data?['nominee_name'] as String?,
      nomineeAdharNumber: data?['nominee_adhar_number'] as String?,
      unitName: data?['unit_name'] as String?,
      photoUrl: data?['photo_url'] as String?,
      governmentPensionNumber: data?['government_pension_number'] != null ? LabelValue.fromMap(data?['government_pension_number']) : null,
      kewsaMembershipNumber: data?['kewsa_membership_number'] != null ? LabelValue.fromMap(data?['kewsa_membership_number']) : null,
      stateWelfareFundNumber: data?['state_welfare_fund_number'] != null ? LabelValue.fromMap(data?['state_welfare_fund_number']) : null,
      wiremenOrsupervisorNumber: data?['wiremen_or_supervisor_number'] != null ? LabelValue.fromMap(data?['wiremen_or_supervisor_number']) : null,
      cOrbOraOrclassLicenseNumber: data?['c/b/a_class_license_number'] != null ? LabelValue.fromMap(data?['c/b/a_class_license_number']) : null,
      // updatedAt: data?['updated_at'] as Timestamp?,
      // createdAt: data?['created_at'] as Timestamp?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (email != null) 'email': email,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (pincode != null) 'pincode': pincode,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (adhaarNumber != null) 'adhaar_number': adhaarNumber,
      if (education != null) 'education': education,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (bloodGroup != null) 'blood_group': bloodGroup,
      if (panchayatOrMunicipality != null) 'panchayat_or_municipality': panchayatOrMunicipality,
      if (nomineeName != null) 'nominee_name': nomineeName,
      if (nomineeAdharNumber != null) 'nominee_adhar_number': nomineeAdharNumber,
      if (unitName != null) 'unit_name': unitName,
      if (photoUrl != null) 'photo_url': photoUrl,
      if (governmentPensionNumber != null) 'government_pension_number': governmentPensionNumber?.toMap(),
      if (kewsaMembershipNumber != null) 'kewsa_membership_number': kewsaMembershipNumber?.toMap(),
      if (stateWelfareFundNumber != null) 'state_welfare_fund_number': stateWelfareFundNumber?.toMap(),
      if (wiremenOrsupervisorNumber != null) 'wiremen_or_supervisor_number': wiremenOrsupervisorNumber?.toMap(),
      if (cOrbOraOrclassLicenseNumber != null) 'c/b/a_class_license_number': cOrbOraOrclassLicenseNumber?.toMap(),
    };
  }

  Map<String, dynamic> createFirestore() {
    return {
      'created_at': FieldValue.serverTimestamp(),
      'updated_at': FieldValue.serverTimestamp(),
      ...toFirestore(),
    };
  }

  Map<String, dynamic> updateFirestore() {
    return {
      'updated_at': FieldValue.serverTimestamp(),
      ...toFirestore(),
    };
  }

  @override
  bool get stringify => true;

  UserEntity copyWith({
    String? id,
    String? email,
    String? name,
    String? address,
    String? pincode,
    String? phoneNumber,
    String? adhaarNumber,
    String? education,
    String? dateOfBirth,
    String? bloodGroup,
    String? panchayatOrMunicipality,
    String? nomineeName,
    String? nomineeAdharNumber,
    String? unitName,
    String? photoUrl,
    LabelValue? governmentPensionNumber,
    LabelValue? kewsaMembershipNumber,
    LabelValue? stateWelfareFundNumber,
    LabelValue? wiremenOrsupervisorNumber,
    LabelValue? cOrbOraOrclassLicenseNumber,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      address: address ?? this.address,
      pincode: pincode ?? this.pincode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      adhaarNumber: adhaarNumber ?? this.adhaarNumber,
      education: education ?? this.education,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      panchayatOrMunicipality: panchayatOrMunicipality ?? this.panchayatOrMunicipality,
      nomineeName: nomineeName ?? this.nomineeName,
      nomineeAdharNumber: nomineeAdharNumber ?? this.nomineeAdharNumber,
      unitName: unitName ?? this.unitName,
      photoUrl: photoUrl ?? this.photoUrl,
      governmentPensionNumber: governmentPensionNumber ?? this.governmentPensionNumber,
      kewsaMembershipNumber: kewsaMembershipNumber ?? this.kewsaMembershipNumber,
      stateWelfareFundNumber: stateWelfareFundNumber ?? this.stateWelfareFundNumber,
      wiremenOrsupervisorNumber: wiremenOrsupervisorNumber ?? this.wiremenOrsupervisorNumber,
      cOrbOraOrclassLicenseNumber: cOrbOraOrclassLicenseNumber ?? this.cOrbOraOrclassLicenseNumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class LabelValue {
  /// The current question's id (unique id).
  final String? number;

  /// The current form's email address.
  final String? yearOfRenewal;
  LabelValue({
    this.number,
    this.yearOfRenewal,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'yearOfRenewal': yearOfRenewal,
    };
  }

  factory LabelValue.fromMap(dynamic data) {
    final map = data as Map<String, dynamic>?;
    return LabelValue(
      number: map?['number'] != null ? map!['number'] as String : null,
      yearOfRenewal: map?['yearOfRenewal'] != null ? map!['yearOfRenewal'] as String : null,
    );
  }
}
