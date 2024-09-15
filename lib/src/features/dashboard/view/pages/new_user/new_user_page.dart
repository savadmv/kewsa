import 'package:kewsa/imports_bindings.dart';

class NewUserPage extends StatelessWidget {
  const NewUserPage({
    super.key,
  });

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const NewUserPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewUserCubit(),
      child: const NewUserContent(),
    );
  }
}
