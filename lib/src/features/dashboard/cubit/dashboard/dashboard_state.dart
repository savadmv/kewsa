// // ignore_for_file: public_member_api_docs, sort_constructors_first
// part of 'dashboard_cubit.dart';

// @immutable
// class DashboardState extends Equatable {
//   const DashboardState({
//     this.isGettingUser = true,
//     this.isGettingAdvertisements = true,
//     this.advertisements = const [],
//     this.user,
//   });

//   final List<AdvertisementEntity> advertisements;
//   final UserEntity? user;
//   final bool isGettingUser;
//   final bool isGettingAdvertisements;

//   @override
//   List<Object?> get props => [advertisements, user, isGettingUser, isGettingAdvertisements];

//   DashboardState copyWith({
//     List<AdvertisementEntity>? advertisements,
//     bool? isGettingAdvertisements,
//     bool? isGettingUser,
//     UserEntity? Function()? user,
//   }) {
//     return DashboardState(
//       advertisements: advertisements ?? this.advertisements,
//       isGettingAdvertisements: isGettingAdvertisements ?? this.isGettingAdvertisements,
//       isGettingUser: isGettingUser ?? this.isGettingUser,
//       user: user != null ? user.call() : this.user,
//     );
//   }
// }
