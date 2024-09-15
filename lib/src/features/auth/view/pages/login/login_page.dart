import 'package:kewsa/imports_bindings.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() {
    return const MaterialPage<void>(child: LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
        child: const LoginForm(),
      ),
    );
  }
}
