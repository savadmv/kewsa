import 'package:api_exception/api_exception.dart';
import 'package:kewsa/imports_bindings.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit({
    required String userId,
    UsersRepository? usersRepository,
  })  : _userId = userId,
        _usersRepository = usersRepository ?? UsersRepository(),
        super(const UserDetailsState()) {
    _userSubscription = _usersRepository.getUserDetailsById(userId: _userId).listen(
          _onUserChanged,
          onError: (dynamic e) => ApiExceptionHandler.handle(e).then((error) => emit(state.copyWith(error: () => error.msg))),
        );
  }
  final String _userId;
  final UsersRepository _usersRepository;
  late final StreamSubscription<UserEntity> _userSubscription;

  void _onUserChanged(UserEntity user) {
    emit(state.copyWith(user: user, isGettingUser: false, error: () => null));
  }

  Future<void> deleteAccount() async {
    if (state.isDeleting || state.user == null) {
      return;
    }
    emit(state.copyWith(deletingError: () => null, isDeleting: true));
    try {
      await _usersRepository.deleteUser(user: state.user!);
      emit(state.copyWith(isDeleted: true));
    } on ApiException catch (e) {
      emit(state.copyWith(deletingError: () => e.msg));
    }
    emit(state.copyWith(isDeleting: false));
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
