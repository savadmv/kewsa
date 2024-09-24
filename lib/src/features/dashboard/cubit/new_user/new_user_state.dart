// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'new_user_cubit.dart';

@immutable
class NewUserState extends Equatable {
  final int stepper;
  final Email email;
  final FormText name;
  final FormText address;
  final Pincode pincode;
  final Phone phone;
  final Adhaar adhaar;
  final FormText education;
  final FormText dateOfBirth;
  final FormText bloodGroup;
  final FormText panchayatOrMunicipality;
  final FormText nomineeName;
  final Adhaar nomineeAdhaar;
  final FormText unitName;
  final FormText photo;
  final ({FormText number, FormText yor}) governmentPension;
  final ({FormText number, FormText yor}) kewsaMembership;
  final ({FormText number, FormText yor}) stateWelfareFund;
  final ({FormText number, FormText yor}) wiremenOrsupervisor;
  final ({FormText number, FormText yor}) cOrbOraOrclassLicense;
  final String? error;
  final bool isUpdate;
  final bool isSaving;
  final bool isSuccess;
  final bool personalDetailsIsValid;
  final bool nomineeDetailsIsValid;
  final bool isValid;

  const NewUserState({
    this.stepper = 0,
    this.email = const Email.pure(),
    this.name = const FormText.pure(),
    this.address = const FormText.pure(),
    this.pincode = const Pincode.pure(),
    this.phone = const Phone.pure(),
    this.adhaar = const Adhaar.pure(),
    this.education = const FormText.pure(),
    this.dateOfBirth = const FormText.pure(),
    this.bloodGroup = const FormText.pure(),
    this.panchayatOrMunicipality = const FormText.pure(),
    this.nomineeName = const FormText.pure(),
    this.nomineeAdhaar = const Adhaar.pure(),
    this.unitName = const FormText.pure(),
    this.photo = const FormText.pure(),
    this.governmentPension = (number: const FormText.pure(), yor: const FormText.pure()),
    this.kewsaMembership = (number: const FormText.pure(), yor: const FormText.pure()),
    this.stateWelfareFund = (number: const FormText.pure(), yor: const FormText.pure()),
    this.wiremenOrsupervisor = (number: const FormText.pure(), yor: const FormText.pure()),
    this.cOrbOraOrclassLicense = (number: const FormText.pure(), yor: const FormText.pure()),
    this.error,
    this.personalDetailsIsValid = false,
    this.nomineeDetailsIsValid = false,
    this.isValid = false,
    this.isSuccess = false,
    this.isUpdate = false,
    this.isSaving = false,
  });

  @override
  List<Object?> get props => [
        stepper,
        email,
        name,
        address,
        pincode,
        phone,
        adhaar,
        education,
        dateOfBirth,
        bloodGroup,
        panchayatOrMunicipality,
        nomineeName,
        nomineeAdhaar,
        unitName,
        photo,
        governmentPension,
        kewsaMembership,
        stateWelfareFund,
        wiremenOrsupervisor,
        cOrbOraOrclassLicense,
        error,
        isSaving,
        isSuccess,
        personalDetailsIsValid,
        nomineeDetailsIsValid,
        nomineeDetailsIsValid,
        isValid,
        isUpdate,
      ];

  @override
  bool get stringify => true;

  NewUserState copyWith({
    int? stepper,
    Email? email,
    FormText? name,
    FormText? address,
    Pincode? pincode,
    Phone? phone,
    Adhaar? adhaar,
    FormText? education,
    FormText? dateOfBirth,
    FormText? bloodGroup,
    FormText? panchayatOrMunicipality,
    FormText? nomineeName,
    Adhaar? nomineeAdhaar,
    FormText? unitName,
    FormText? photo,
    ({FormText number, FormText yor})? governmentPension,
    ({FormText number, FormText yor})? kewsaMembership,
    ({FormText number, FormText yor})? stateWelfareFund,
    ({FormText number, FormText yor})? wiremenOrsupervisor,
    ({FormText number, FormText yor})? cOrbOraOrclassLicense,
    String? Function()? error,
    bool? isSaving,
    bool? isSuccess,
    bool? personalDetailsIsValid,
    bool? nomineeDetailsIsValid,
    bool? isValid,
    bool? isUpdate,
  }) {
    return NewUserState(
      stepper: stepper ?? this.stepper,
      email: email ?? this.email,
      name: name ?? this.name,
      address: address ?? this.address,
      pincode: pincode ?? this.pincode,
      phone: phone ?? this.phone,
      adhaar: adhaar ?? this.adhaar,
      education: education ?? this.education,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      panchayatOrMunicipality: panchayatOrMunicipality ?? this.panchayatOrMunicipality,
      nomineeName: nomineeName ?? this.nomineeName,
      nomineeAdhaar: nomineeAdhaar ?? this.nomineeAdhaar,
      unitName: unitName ?? this.unitName,
      photo: photo ?? this.photo,
      governmentPension: governmentPension ?? this.governmentPension,
      kewsaMembership: kewsaMembership ?? this.kewsaMembership,
      stateWelfareFund: stateWelfareFund ?? this.stateWelfareFund,
      wiremenOrsupervisor: wiremenOrsupervisor ?? this.wiremenOrsupervisor,
      cOrbOraOrclassLicense: cOrbOraOrclassLicense ?? this.cOrbOraOrclassLicense,
      error: error != null ? error.call() : this.error,
      isSaving: isSaving ?? this.isSaving,
      isSuccess: isSuccess ?? this.isSuccess,
      personalDetailsIsValid: personalDetailsIsValid ?? this.personalDetailsIsValid,
      nomineeDetailsIsValid: nomineeDetailsIsValid ?? this.nomineeDetailsIsValid,
      isValid: isValid ?? this.isValid,
      isUpdate: isUpdate ?? this.isUpdate,
    );
  }
}
