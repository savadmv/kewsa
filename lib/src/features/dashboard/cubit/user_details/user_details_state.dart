// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_details_cubit.dart';

@immutable
class UserDetailsState extends Equatable {
  const UserDetailsState({
    this.isGettingUser = true,
    this.user,
    this.error,
    this.isDeleting = false,
    this.deletingError,
    this.isDeleted = false,
  });

  final UserEntity? user;
  final bool isGettingUser;
  final String? error;
  final String? deletingError;
  final bool isDeleting;
  final bool isDeleted;

  @override
  List<Object?> get props => [
        user,
        isGettingUser,
        error,
        deletingError,
        isDeleting,
        isDeleted,
      ];

  UserDetailsState copyWith({
    UserEntity? user,
    bool? isGettingUser,
    bool? isDeleting,
    bool? isDeleted,
    String? Function()? error,
    String? Function()? deletingError,
  }) {
    return UserDetailsState(
      user: user ?? this.user,
      isGettingUser: isGettingUser ?? this.isGettingUser,
      isDeleting: isDeleting ?? this.isDeleting,
      isDeleted: isDeleted ?? this.isDeleted,
      error: error != null ? error.call() : this.error,
      deletingError: deletingError != null ? deletingError.call() : this.deletingError,
    );
  }
}
