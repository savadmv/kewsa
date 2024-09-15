// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:kewsa/imports_bindings.dart';

// class SignUpForm extends StatelessWidget {
//   const SignUpForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<SignUpCubit, SignUpState>(
//       listener: (context, state) {
//         if (state.status.isSuccess) {
//           Navigator.of(context).pop();
//         } else if (state.status.isFailure) {
//           ScaffoldMessenger.of(context)
//             ..hideCurrentSnackBar()
//             ..showSnackBar(
//               SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
//             );
//         }
//       },
//       child: const ResponsiveWidget(
//         s: _S(),
//         // l: _L(),
//       ),
//     );
//   }
// }

// class _S extends StatelessWidget {
//   const _S();

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//           return ConstrainedBox(
//             constraints: BoxConstraints(
//               maxWidth: responsiveSize(context, s: constraints.maxWidth * .9, m: 400),
//             ),
//             child: Center(
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const AuthFormTitle(isLogin: false),
//                     const SizedBox(height: 16),
//                     _EmailInput(),
//                     const SizedBox(height: 8),
//                     _PasswordInput(),
//                     const SizedBox(height: 8),
//                     _ConfirmPasswordInput(),
//                     const SizedBox(height: 12),
//                     _SignUpButton(),
//                     const SizedBox(height: 12),
//                     _LoginButton(),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// // class _L extends StatelessWidget {
// //   const _L();

// //   @override
// //   Widget build(BuildContext context) {
// //     return const Row(
// //       children: [
// //         Flexible(
// //           child: ColoredBox(
// //             color: AppColors.lightPrimary,
// //             child: SizedBox(
// //               width: double.maxFinite,
// //               child: Column(),
// //             ),
// //           ),
// //         ),
// //         Flexible(
// //           child: _S(),
// //         ),
// //       ],
// //     );
// //   }
// // }

// class _EmailInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SignUpCubit, SignUpState>(
//       buildWhen: (previous, current) => previous.email != current.email,
//       builder: (context, state) {
//         return TextField(
//           key: const Key('signUpForm_emailInput_textField'),
//           onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
//           keyboardType: TextInputType.emailAddress,
//           decoration: InputDecoration(
//             labelText: 'email',
//             helperText: '',
//             errorText: state.email.displayError != null ? 'invalid email' : null,
//           ),
//         );
//       },
//     );
//   }
// }

// class _PasswordInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SignUpCubit, SignUpState>(
//       buildWhen: (previous, current) => previous.password != current.password,
//       builder: (context, state) {
//         return TextField(
//           key: const Key('signUpForm_passwordInput_textField'),
//           onChanged: (password) => context.read<SignUpCubit>().passwordChanged(password),
//           obscureText: true,
//           decoration: InputDecoration(
//             labelText: 'password',
//             helperText: '',
//             errorText: state.password.displayError != null ? 'invalid password' : null,
//           ),
//         );
//       },
//     );
//   }
// }

// class _ConfirmPasswordInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SignUpCubit, SignUpState>(
//       buildWhen: (previous, current) => previous.password != current.password || previous.confirmedPassword != current.confirmedPassword,
//       builder: (context, state) {
//         return TextField(
//           key: const Key('signUpForm_confirmedPasswordInput_textField'),
//           onChanged: (confirmPassword) => context.read<SignUpCubit>().confirmedPasswordChanged(confirmPassword),
//           obscureText: true,
//           decoration: InputDecoration(
//             labelText: 'confirm password',
//             helperText: '',
//             errorText: state.confirmedPassword.displayError != null ? 'passwords do not match' : null,
//           ),
//         );
//       },
//     );
//   }
// }

// class _SignUpButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SignUpCubit, SignUpState>(
//       builder: (context, state) {
//         final inProgress = state.status.isInProgress;
//         return SizedBox(
//           width: double.maxFinite,
//           child: ElevatedButton(
//             key: const Key('signUpForm_continue_raisedButton'),
//             onPressed: state.isValid ? () => context.read<SignUpCubit>().signUpFormSubmitted() : null,
//             child: switch (inProgress) {
//               true => const SizedBox.square(
//                   dimension: 16,
//                   child: CupertinoActivityIndicator(
//                     color: AppColors.dark,
//                   ),
//                 ),
//               _ => Text(
//                   'Sign up',
//                   style: AppStyles.text16Px,
//                 ),
//             },
//           ),
//         );
//       },
//     );
//   }
// }

// class _LoginButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: RichText(
//         key: const Key('signUpForm_login_raisedButton'),
//         text: TextSpan(
//           text: 'Have an account ?  ',
//           style: AppStyles.text14Px.copyWith(fontWeight: FontWeight.w500).dark,
//           children: [
//             TextSpan(
//               text: 'Login your account',
//               style: AppStyles.text15Px.copyWith(fontWeight: FontWeight.w700).accent,
//               recognizer: TapGestureRecognizer()..onTap = context.pop,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
