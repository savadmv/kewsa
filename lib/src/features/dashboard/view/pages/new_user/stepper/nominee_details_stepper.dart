// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kewsa/imports_bindings.dart';

class NomineeDetailsStepper extends StatelessWidget {
  const NomineeDetailsStepper({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NewUserCubit>();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            _NomineeNameInput(),
            _NomineeAdhaarInput(),
          ],
        ),
      ),
    );
  }
}

class _NomineeNameInput extends StatelessWidget {
  const _NomineeNameInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserCubit, NewUserState>(
      buildWhen: (p, c) => p.nomineeName != c.nomineeName,
      builder: (context, state) {
        return Input(
          text: state.nomineeName.value,
          enabled: !state.isSaving,
          label: 'Nominee Name',
          keyboardType: TextInputType.name,
          errorText: switch (state.nomineeName.error) {
            FormTextError.empty => 'Please enter nominee name !',
            _ => null,
          },
          onChanged: context.read<NewUserCubit>().nomineeNameChanged,
        );
      },
    );
  }
}

class _NomineeAdhaarInput extends StatelessWidget {
  const _NomineeAdhaarInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserCubit, NewUserState>(
      buildWhen: (p, c) => p.nomineeAdhaar != c.nomineeAdhaar,
      builder: (context, state) {
        return Input(
          text: state.nomineeAdhaar.value,
          enabled: !state.isSaving,
          keyboardType: TextInputType.number,
          label: 'Nominee Adhaar',
          limit: 16,
          errorText: switch (state.nomineeAdhaar.error) {
            AdhaarError.empty => 'Please enter adhaar number !',
            AdhaarError.length => 'Adhaar number not valid !',
            _ => null,
          },
          onChanged: context.read<NewUserCubit>().nomineeAdhaarChanged,
        );
      },
    );
  }
}
