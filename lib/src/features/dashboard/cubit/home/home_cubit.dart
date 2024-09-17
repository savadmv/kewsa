import 'package:kewsa/imports_bindings.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    UsersRepository? usersRepository,
  })  : _usersRepository = usersRepository ?? UsersRepository(),
        super(const HomeState()) {
    _userSubscription = _usersRepository.users.listen(_onUserChanged);
    _unitNamesSubscription = _usersRepository.unitNames.listen(_onUnitNamesChanged);
  }

  final UsersRepository _usersRepository;
  late final StreamSubscription<List<UserEntity>> _userSubscription;
  late final StreamSubscription<List<UnitNameEntity>> _unitNamesSubscription;

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

  @override
  Future<void> close() {
    _userSubscription.cancel();
    _unitNamesSubscription.cancel();
    return super.close();
  }
}
