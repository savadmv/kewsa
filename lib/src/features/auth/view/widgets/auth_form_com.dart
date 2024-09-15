import 'package:kewsa/imports_bindings.dart';

class AuthFormTitle extends StatelessWidget {
  const AuthFormTitle({required this.isLogin, super.key});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          isLogin ? 'Log in to your Account' : 'Sign up for your account',
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 6),
        Text(
          'Welcome back! Select method to ${isLogin ? 'Log in' : 'Sign up'}',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: AppColors.dark),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
