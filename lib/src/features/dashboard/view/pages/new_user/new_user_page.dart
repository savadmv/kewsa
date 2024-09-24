import 'package:kewsa/imports_bindings.dart';

class NewUserPage extends StatelessWidget {
  const NewUserPage({
    super.key,
    this.userDetails,
  });

  final UserEntity? userDetails;

  static Route<void> route(UserEntity? userDetails, HomeCubit cubit) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider(
        create: (context) => cubit,
        child: NewUserPage(userDetails: userDetails),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewUserCubit(userDetails: userDetails),
      child: NewUserContent(userDetails: userDetails),
    );
  }
}
