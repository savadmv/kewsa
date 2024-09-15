// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

@immutable
class HomeState extends Equatable {
  const HomeState({
    this.isGettingUsers = true,
    this.users = const [],
    this.error,
  });

  final List<UserEntity> users;
  final bool isGettingUsers;
  final String? error;

  @override
  List<Object?> get props => [users, isGettingUsers];

  HomeState copyWith({
    List<UserEntity>? users,
    bool? isGettingUsers,
    String? Function()? error,
  }) {
    return HomeState(
      users: users ?? this.users,
      isGettingUsers: isGettingUsers ?? this.isGettingUsers,
      error: error != null ? error.call() : this.error,
    );
  }
}
