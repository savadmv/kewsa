import 'package:kewsa/imports_bindings.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    UsersRepository? usersRepository,
  })  : _usersRepository = usersRepository ?? UsersRepository(),
        super(const HomeState()) {
    _userSubscription = _usersRepository.users.listen(_onUserChanged);
  }

  final UsersRepository _usersRepository;
  late final StreamSubscription<List<UserEntity>> _userSubscription;

  void _onUserChanged(List<UserEntity> users) {
    emit(state.copyWith(users: users, isGettingUsers: false));
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
