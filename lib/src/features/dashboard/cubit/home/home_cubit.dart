import 'package:kewsa/imports_bindings.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    UsersRepository? usersRepository,
  })  : _usersRepository = usersRepository ?? UsersRepository(),
        super(const HomeState()) {
    _userSubscription = _usersRepository.users.listen(_onUserChanged);
    _unitNamesSubscription = _usersRepository.unitNames.listen(_onUnitNamesChanged);
    // init();
  }

  final UsersRepository _usersRepository;
  late final StreamSubscription<List<UserEntity>> _userSubscription;
  late final StreamSubscription<List<UnitNameEntity>> _unitNamesSubscription;

  // void init() async {

  //   ///
  //   final thrissurCentralUnit = users.where((e) => '${e.unitName}'.contains('THRISSUR CENTRAL') || '${e.unitName}'.contains('THRISSSUR CENTRAL'));
  //   write('init user repo -> Got : ${thrissurCentralUnit.length} THRISSUR CENTRAL Users');
  //   for (final user in thrissurCentralUnit) {
  //     await _usersRepository.updateUser(user: const UserEntity(unitName: 'THRISSUR CENTRAL'), userId: user.id!);
  //     write('init user repo -> Added : ${user.id}');
  //   }

  //   ///
  //   final KODUNGALLUR = users.where((e) => '${e.unitName}'.contains('KODUNGALLUR'));
  //   write('init user repo -> Got : ${KODUNGALLUR.length} KODUNGALLUR Users');
  //   for (final user in KODUNGALLUR) {
  //     await _usersRepository.updateUser(user: const UserEntity(unitName: 'KODUNGALLUR'), userId: user.id!);
  //     write('init user repo -> Added : ${user.id}');
  //   }

  //   ///
  //   final VADANAPPALLY = users.where((e) => '${e.unitName}'.contains('VADANAPPILLY') || '${e.unitName}'.contains('VATANAPPALLY') || '${e.unitName}'.contains('VADANAPPALLY'));
  //   write('init user repo -> Got : ${VADANAPPALLY.length} VADANAPPALLY Users');
  //   for (final user in VADANAPPALLY) {
  //     await _usersRepository.updateUser(user: const UserEntity(unitName: 'VADANAPPALLY'), userId: user.id!);
  //     write('init user repo -> Added : ${user.id}');
  //   }

  //   ///
  //   final KORATTY = users.where((e) => '${e.unitName}'.contains('KORATTY'));
  //   write('init user repo -> Got : ${VADANAPPALLY.length} KORATTY Users');
  //   for (final user in KORATTY) {
  //     await _usersRepository.updateUser(user: const UserEntity(unitName: 'KORATTY'), userId: user.id!);
  //     write('init user repo -> Added : ${user.id}');
  //   }

  //   ///
  //   final KANDASSANKADAVU = users.where((e) => '${e.unitName}'.contains('KANDASSANKADAVU'));
  //   write('init user repo -> Got : ${KANDASSANKADAVU.length} KANDASSANKADAVU Users');
  //   for (final user in KANDASSANKADAVU) {
  //     await _usersRepository.updateUser(user: const UserEntity(unitName: 'KANDASSANKADAVU'), userId: user.id!);
  //     write('init user repo -> Added : ${user.id}');
  //   }

  //   ///
  //   final unitNames = (await _usersRepository.usersDetails.first).map((e) => e.unitName).toSet();
  //   write('init user repo -> Got : ${unitNames.length} Unit Names');
  //   for (final unit in unitNames) {
  //     await _usersRepository.newUnit(unit: UnitNameEntity(unitName: unit));
  //     write('init user repo -> Added : $unit');
  //   }

  //   write('init user repo -> Operation Completed');
  // }

  void _onUserChanged(List<UserEntity> users) {
    emit(state.copyWith(users: users, isGettingUsers: false));
  }

  void _onUnitNamesChanged(List<UnitNameEntity> unitNames) {
    emit(state.copyWith(isGettingUnitNames: false, unitNames: unitNames));
  }

  void updateSelUnitNames(UnitNameEntity unitName, {required bool isSelected}) {
    final selUnitNames = [...state.selUnitNames];
    if (isSelected) {
      selUnitNames.remove(unitName);
    } else {
      selUnitNames.add(unitName);
    }
    emit(state.copyWith(selUnitNames: [...selUnitNames]));
  }

  void clearUnitNames() {
    emit(state.copyWith(selUnitNames: []));
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    _unitNamesSubscription.cancel();
    return super.close();
  }
}
