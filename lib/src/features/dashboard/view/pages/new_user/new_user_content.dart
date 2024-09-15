// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:kewsa/imports_bindings.dart';

class NewUserContent extends StatelessWidget {
  const NewUserContent({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        final state = context.read<NewUserCubit>().state;
        if (state.stepper == 0 || state.isSuccess) {
          context.pop();
        } else {
          context.read<NewUserCubit>().changeStepper(state.stepper - 1);
        }
      },
      child: BlocListener<NewUserCubit, NewUserState>(
        listenWhen: (p, c) => p.error != c.error || p.isSuccess != c.isSuccess,
        listener: (context, state) {
          if (state.isSuccess) {
            context.pop();
          } else if (state.error != null) {
            ScaffoldMessenger.of(context)
              ..clearSnackBars()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.error ?? 'Something went wrong! Please try again later.'),
                ),
              );
          }
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Add Member'),
            ),
            body: Column(
              children: [
                BlocBuilder<NewUserCubit, NewUserState>(
                  buildWhen: (p, c) => p.stepper != c.stepper,
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...[
                          (onTap: () {}, text: 'Personal'),
                          (onTap: () {}, text: 'Nominee'),
                          (onTap: () {}, text: 'Membership'),
                        ].asMap().entries.map(
                          (e) {
                            return Flexible(
                              child: Column(
                                children: [
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(),
                                      color: Colors.black.withOpacity(e.key <= state.stepper ? 0.1 : 0),
                                    ),
                                    child: Text('${e.key + 1}').center.pad(8),
                                  ),
                                  Text(
                                    e.value.text,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ).pxy(y: 16),
                BlocBuilder<NewUserCubit, NewUserState>(
                  buildWhen: (p, c) => p.stepper != c.stepper,
                  builder: (context, state) {
                    return Expanded(
                      child: [
                        const PersonalDetailsStepper(),
                        const NomineeDetailsStepper(),
                        const MembershipAndLicensesStepper(),
                      ][state.stepper],
                    );
                  },
                ),
              ],
            ),
            bottomNavigationBar: BlocBuilder<NewUserCubit, NewUserState>(
              buildWhen: (p, c) =>
                  p.stepper != c.stepper ||
                  p.personalDetailsIsValid != c.personalDetailsIsValid ||
                  p.nomineeDetailsIsValid != c.nomineeDetailsIsValid ||
                  p.isValid != c.isValid ||
                  p.isSaving != c.isSaving,
              builder: (context, state) {
                final isEnabled =
                    ((state.personalDetailsIsValid && state.stepper == 0) || (state.nomineeDetailsIsValid && state.stepper == 1) || (state.isValid && state.stepper == 2)) && !state.isSaving;
                return ElevatedButton(
                  onPressed: !isEnabled
                      ? null
                      : () {
                          final currentStepper = context.read<NewUserCubit>().state.stepper;
                          if (currentStepper == 2) {
                            context.read<NewUserCubit>().addMember();
                          } else {
                            context.read<NewUserCubit>().changeStepper(currentStepper + 1);
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                  child: switch (state.isSaving) {
                    true => const CupertinoActivityIndicator(
                        color: AppColors.light,
                        radius: 8,
                      ),
                    false => Text(
                        switch (state.stepper == 2) {
                          false => 'Next',
                          _ => 'Submit',
                        },
                      ),
                  },
                );
              },
            ).pad(16),
          ),
        ),
      ),
    );
  }
}
