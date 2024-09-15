// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_details_cubit.dart';

@immutable
class UserDetailsState extends Equatable {
  const UserDetailsState({
    this.isGettingUser = true,
    this.user,
    this.error,
  });

  final UserEntity? user;
  final bool isGettingUser;
  final String? error;

  @override
  List<Object?> get props => [user, isGettingUser, error];

  UserDetailsState copyWith({
    UserEntity? user,
    bool? isGettingUser,
    String? Function()? error,
  }) {
    return UserDetailsState(
      user: user ?? this.user,
      isGettingUser: isGettingUser ?? this.isGettingUser,
      error: error != null ? error.call() : this.error,
    );
  }
}
