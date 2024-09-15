import 'package:kewsa/imports_bindings.dart';

part 'new_user_state.dart';

class NewUserCubit extends Cubit<NewUserState> {
  NewUserCubit({UsersRepository? usersRepository})
      : _usersRepository = usersRepository ?? UsersRepository(),
        super(const NewUserState());

  final UsersRepository _usersRepository;

  void changeStepper(int index) {
    emit(state.copyWith(stepper: index));
  }

  void _validatepersonalDetails() {
    emit(
      state.copyWith(
        personalDetailsIsValid: Formz.validate([
          state.email,
          state.name,
          state.address,
          state.pincode,
          state.phone,
          state.adhaar,
          state.education,
          state.dateOfBirth,
          state.bloodGroup,
          state.panchayatOrMunicipality,
        ]),
      ),
    );
  }

  void _validateNomineeDetails() {
    emit(
      state.copyWith(
        nomineeDetailsIsValid: Formz.validate([
          state.nomineeName,
          state.nomineeAdhaar,
        ]),
      ),
    );
  }

  void _validate() {
    emit(
      state.copyWith(
        isValid: Formz.validate([
          state.governmentPension.number,
          state.governmentPension.yor,
          state.kewsaMembership.number,
          state.kewsaMembership.yor,
          state.stateWelfareFund.number,
          state.stateWelfareFund.yor,
          state.wiremenOrsupervisor.number,
          state.wiremenOrsupervisor.yor,
          state.cOrbOraOrclassLicense.number,
          state.cOrbOraOrclassLicense.yor,
        ]),
      ),
    );
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: Email.dirty(value)));
    _validatepersonalDetails();
  }

  void nameChanged(String value) {
    emit(state.copyWith(name: FormText.dirty(value)));
    _validatepersonalDetails();
  }

  void addressChanged(String value) {
    emit(state.copyWith(address: FormText.dirty(value)));
    _validatepersonalDetails();
  }

  void picodeChanged(String value) {
    emit(state.copyWith(pincode: Pincode.dirty(value: value)));
    _validatepersonalDetails();
  }

  void phoneChanged(String value) {
    emit(state.copyWith(phone: Phone.dirty(value: value)));
    _validatepersonalDetails();
  }

  void adhaarChanged(String value) {
    emit(state.copyWith(adhaar: Adhaar.dirty(value: value)));
    _validatepersonalDetails();
  }

  void educationChanged(String value) {
    emit(state.copyWith(education: FormText.dirty(value)));
    _validatepersonalDetails();
  }

  void dateOfBirthChanged(String value) {
    emit(state.copyWith(dateOfBirth: FormText.dirty(value)));
    _validatepersonalDetails();
  }

  void bloodGroupChanged(String value) {
    emit(state.copyWith(bloodGroup: FormText.dirty(value)));
    _validatepersonalDetails();
  }

  void panchayatOrMunicipalityChanged(String value) {
    emit(state.copyWith(panchayatOrMunicipality: FormText.dirty(value)));
    _validatepersonalDetails();
  }

  void nomineeNameChanged(String value) {
    emit(state.copyWith(nomineeName: FormText.dirty(value)));
    _validateNomineeDetails();
  }

  void nomineeAdhaarChanged(String value) {
    emit(state.copyWith(nomineeAdhaar: Adhaar.dirty(value: value)));
    _validateNomineeDetails();
  }

  void unitNameChanged(String value) {
    emit(state.copyWith(unitName: FormText.dirty(value)));
    _validate();
  }

  void photoChanged(String value) {
    emit(state.copyWith(photo: value));
  }

  void governmentPensionChanged(String value) {
    emit(state.copyWith(governmentPension: (number: FormText.dirty(value), yor: state.governmentPension.yor)));
    _validate();
  }

  void governmentPensionYorChanged(String value) {
    emit(state.copyWith(governmentPension: (number: state.governmentPension.number, yor: FormText.dirty(value))));
    _validate();
  }

  void kewsaMembershipChanged(String value) {
    emit(state.copyWith(kewsaMembership: (number: FormText.dirty(value), yor: state.kewsaMembership.yor)));
    _validate();
  }

  void kewsaMembershipYorChanged(String value) {
    emit(state.copyWith(kewsaMembership: (number: state.kewsaMembership.number, yor: FormText.dirty(value))));
    _validate();
  }

  void stateWelfareFundChanged(String value) {
    emit(state.copyWith(stateWelfareFund: (number: FormText.dirty(value), yor: state.stateWelfareFund.yor)));
    _validate();
  }

  void stateWelfareFundYorChanged(String value) {
    emit(state.copyWith(stateWelfareFund: (number: state.stateWelfareFund.number, yor: FormText.dirty(value))));
    _validate();
  }

  void wiremenOrsupervisorChanged(String value) {
    emit(state.copyWith(wiremenOrsupervisor: (number: FormText.dirty(value), yor: state.wiremenOrsupervisor.yor)));
    _validate();
  }

  void wiremenOrsupervisorYorChanged(String value) {
    emit(state.copyWith(wiremenOrsupervisor: (number: state.wiremenOrsupervisor.number, yor: FormText.dirty(value))));
    _validate();
  }

  void cOrbOraOrclassLicenseChanged(String value) {
    emit(state.copyWith(cOrbOraOrclassLicense: (number: FormText.dirty(value), yor: state.cOrbOraOrclassLicense.yor)));
    _validate();
  }

  void cOrbOraOrclassLicenseYorChanged(String value) {
    emit(state.copyWith(cOrbOraOrclassLicense: (number: state.cOrbOraOrclassLicense.number, yor: FormText.dirty(value))));
    _validate();
  }

  Future<void> addMember() async {
    if (state.isSaving) {
      return;
    }

    emit(state.copyWith(error: () => null, isSuccess: false));
    _validatepersonalDetails();
    _validateNomineeDetails();
    _validate();

    if (!state.personalDetailsIsValid) {
      emit(state.copyWith(error: () => "Personal details isn't valid !!"));
      return;
    }

    if (!state.nomineeDetailsIsValid) {
      emit(state.copyWith(error: () => "Nominee details isn't valid !!"));
      return;
    }

    if (!state.isValid) {
      emit(state.copyWith(error: () => "Membership details isn't valid !!"));
      return;
    }

    emit(state.copyWith(isSaving: true));

    try {
      await _usersRepository.createUser(
        user: UserEntity(
          address: state.address.value,
          adhaarNumber: state.adhaar.value,
          bloodGroup: state.bloodGroup.value,
          unitName: state.unitName.value,
          education: state.education.value,
          dateOfBirth: state.dateOfBirth.value,
          email: state.email.value,
          photoUrl: state.photo,
          pincode: state.pincode.value,
          panchayatOrMunicipality: state.panchayatOrMunicipality.value,
          name: state.name.value,
          phoneNumber: state.phone.value,
          nomineeName: state.nomineeName.value,
          nomineeAdharNumber: state.nomineeAdhaar.value,
          wiremenOrsupervisorNumber: LabelValue(
            number: state.wiremenOrsupervisor.number.value,
            yearOfRenewal: state.wiremenOrsupervisor.yor.value,
          ),
          governmentPensionNumber: LabelValue(
            number: state.governmentPension.number.value,
            yearOfRenewal: state.governmentPension.yor.value,
          ),
          stateWelfareFundNumber: LabelValue(
            number: state.stateWelfareFund.number.value,
            yearOfRenewal: state.stateWelfareFund.yor.value,
          ),
          kewsaMembershipNumber: LabelValue(
            number: state.kewsaMembership.number.value,
            yearOfRenewal: state.kewsaMembership.yor.value,
          ),
          cOrbOraOrclassLicenseNumber: LabelValue(
            number: state.cOrbOraOrclassLicense.number.value,
            yearOfRenewal: state.cOrbOraOrclassLicense.yor.value,
          ),
        ),
      );
      emit(state.copyWith(isSaving: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(error: () => '$e', isSaving: false, isSuccess: true));
    }
  }

  // Future<void> read() async {
  //   // Load the CSV file from assets
  //   final csvData = await rootBundle.loadString('assets/res.csv');

  //   // Convert CSV data to List of Lists
  //   final csvTable = const CsvToListConverter().convert(csvData);

  //   ///
  //   for (final line in csvTable.sublist(1).asMap().entries) {
  //     await _usersRepository.createUser(
  //       user: UserEntity(
  //         address: '${line.value[0]}',
  //         name: '${line.value[1]}',
  //         pincode: '${line.value[2]}',
  //         phoneNumber: '${line.value[3]}',
  //         adhaarNumber: '${line.value[4]}',
  //         education: '${line.value[5]}',
  //         dateOfBirth: '${line.value[6]}',
  //         email: '${line.value[7]}',
  //         bloodGroup: '${line.value[8]}',
  //         panchayatOrMunicipality: '${line.value[9]}',
  //         governmentPensionNumber: LabelValue(
  //           number: '${line.value[10]}',
  //           yearOfRenewal: '${line.value[11]}',
  //         ),
  //         kewsaMembershipNumber: LabelValue(
  //           number: '${line.value[12]}',
  //           yearOfRenewal: '${line.value[13]}',
  //         ),
  //         stateWelfareFundNumber: LabelValue(
  //           number: '${line.value[14]}',
  //           yearOfRenewal: '${line.value[15]}',
  //         ),
  //         wiremenOrsupervisorNumber: LabelValue(
  //           number: '${line.value[16]}',
  //           yearOfRenewal: '${line.value[17]}',
  //         ),
  //         cOrbOraOrclassLicenseNumber: LabelValue(
  //           number: '${line.value[18]}',
  //           yearOfRenewal: '${line.value[19]}',
  //         ),
  //         nomineeName: '${line.value[20]}',
  //         nomineeAdharNumber: '${line.value[21]}',
  //         unitName: '${line.value[22]}',
  //         photoUrl: '${line.value[23]}',
  //       ),
  //     );
  //     write(line.key.toString());
  //   }
  // }
}
