import 'package:kewsa/imports_bindings.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({
    required this.id,
    super.key,
  });

  final String id;

  static Route<void> route({required String id, required HomeCubit homeCubit}) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider(
        create: (context) => homeCubit,
        child: UserDetailsPage(id: id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDetailsCubit(userId: id),
      child: const UserDetailsContent(),
    );
  }
}
