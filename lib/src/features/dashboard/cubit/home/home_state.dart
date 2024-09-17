// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

@immutable
class HomeState extends Equatable {
  const HomeState({
    this.isGettingUsers = true,
    this.isGettingUnitNames = true,
    this.users = const [],
    this.unitNames = const [],
    this.selUnitNames = const [],
    this.error,
  });

  final List<UserEntity> users;
  final List<UnitNameEntity> unitNames;
  final List<UnitNameEntity> selUnitNames;
  final bool isGettingUsers;
  final bool isGettingUnitNames;
  final String? error;

  @override
  List<Object?> get props => [
        users,
        unitNames,
        selUnitNames,
        isGettingUsers,
        isGettingUnitNames,
        error,
      ];

  HomeState copyWith({
    List<UserEntity>? users,
    List<UnitNameEntity>? unitNames,
    List<UnitNameEntity>? selUnitNames,
    bool? isGettingUsers,
    bool? isGettingUnitNames,
    String? Function()? error,
  }) {
    return HomeState(
      users: users ?? this.users,
      unitNames: unitNames ?? this.unitNames,
      selUnitNames: selUnitNames ?? this.selUnitNames,
      isGettingUsers: isGettingUsers ?? this.isGettingUsers,
      isGettingUnitNames: isGettingUnitNames ?? this.isGettingUnitNames,
      error: error != null ? error.call() : this.error,
    );
  }
}
