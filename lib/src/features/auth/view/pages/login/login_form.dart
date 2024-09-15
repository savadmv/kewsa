import 'package:flutter/cupertino.dart';
import 'package:kewsa/imports_bindings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: const ResponsiveWidget(
        s: _S(),
        // l: _L(),
      ),
    );
  }
}

class _S extends StatelessWidget {
  const _S();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: responsiveSize(context, s: constraints.maxWidth * .9, m: 400),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const AuthFormTitle(isLogin: true),
                    const SizedBox(height: 16),
                    _EmailInput(),
                    const SizedBox(height: 8),
                    _PasswordInput(),
                    const SizedBox(height: 8),
                    _LoginButton(),
                    const SizedBox(height: 12),
                    // _SignUpButton(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// class _L extends StatelessWidget {
//   const _L();

//   @override
//   Widget build(BuildContext context) {
//     return const Row(
//       children: [
//         Flexible(
//           child: ColoredBox(
//             color: AppColors.lightPrimary,
//             child: SizedBox(
//               width: double.maxFinite,
//               child: Column(),
//             ),
//           ),
//         ),
//         Flexible(
//           child: _S(),
//         ),
//       ],
//     );
//   }
// }

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            helperText: '',
            errorText: state.email.displayError != null ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) => context.read<LoginCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            helperText: '',
            errorText: state.password.displayError != null ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final inProgress = state.status.isInProgress;
        return SizedBox(
          width: double.maxFinite,
          child: ElevatedButton(
            key: const Key('loginForm_continue_raisedButton'),
            onPressed: state.isValid && !inProgress ? () => context.read<LoginCubit>().logInWithCredentials() : null,
            child: switch (inProgress) {
              true => const SizedBox.square(
                  dimension: 16,
                  child: CupertinoActivityIndicator(
                    color: AppColors.dark,
                  ),
                ),
              _ => Text(
                  'Log in',
                  style: AppStyles.text16Px,
                ),
            },
          ),
        );
      },
    );
  }
}

// class _SignUpButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: RichText(
//         key: const Key('loginForm_createAccount_flatButton'),
//         text: TextSpan(
//           text: "Don't have an account ?  ",
//           style: AppStyles.text14Px.copyWith(fontWeight: FontWeight.w500).dark,
//           children: [
//             TextSpan(
//               text: 'Create an account',
//               style: AppStyles.text15Px.copyWith(fontWeight: FontWeight.w700).accent,
//               recognizer: TapGestureRecognizer()..onTap = () => context.push(SignUpPage.route()),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
