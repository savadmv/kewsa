// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kewsa/imports_bindings.dart';

class MembershipAndLicensesStepper extends StatelessWidget {
  const MembershipAndLicensesStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            _UnitNameInput(),
            _GovernmentPensionInput(),
            _KewsaInput(),
            _StateWelfareFundInput(),
            _WiremenOrSupervisorInput(),
            _COrbOraOrclassLicenseFundInput(),
          ],
        ),
      ),
    );
  }
}

class _UnitNameInput extends StatelessWidget {
  const _UnitNameInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserCubit, NewUserState>(
      buildWhen: (p, c) => p.unitName != c.unitName,
      builder: (context, state) {
        return Input(
          text: state.unitName.value,
          enabled: !state.isSaving,
          label: 'Unit Name',
          errorText: switch (state.unitName.error) {
            FormTextError.empty => 'Please enter unit name !',
            _ => null,
          },
          onChanged: context.read<NewUserCubit>().unitNameChanged,
        );
      },
    );
  }
}

class _GovernmentPensionInput extends StatelessWidget {
  const _GovernmentPensionInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserCubit, NewUserState>(
      buildWhen: (p, c) => p.governmentPension != c.governmentPension,
      builder: (context, state) {
        return YorAndLabelInput(
          key: Key('memberships_and_licenses_government_pension_input_input${state.governmentPension.yor.value}'),
          numberInitialValue: state.governmentPension.number.value,
          numberLabel: 'Gov Pension Number',
          yorInitialValue: state.governmentPension.yor.value,
          enabled: true,
          numberChanged: context.read<NewUserCubit>().governmentPensionChanged,
          yorChanged: context.read<NewUserCubit>().governmentPensionYorChanged,
          error: switch (state.governmentPension.number.displayError != null || state.governmentPension.yor.displayError != null) {
            true => 'Please enter valid gov pension details !',
            _ => null,
          },
        );
      },
    );
  }
}

class _KewsaInput extends StatelessWidget {
  const _KewsaInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserCubit, NewUserState>(
      buildWhen: (p, c) => p.kewsaMembership != c.kewsaMembership,
      builder: (context, state) {
        return YorAndLabelInput(
          key: Key('memberships_and_licenses__kewsa_input${state.kewsaMembership.yor.value}'),
          numberInitialValue: state.kewsaMembership.number.value,
          numberLabel: 'KEWSA Number',
          yorInitialValue: state.kewsaMembership.yor.value,
          enabled: true,
          numberChanged: context.read<NewUserCubit>().kewsaMembershipChanged,
          yorChanged: context.read<NewUserCubit>().kewsaMembershipYorChanged,
          error: switch (state.kewsaMembership.number.displayError != null || state.kewsaMembership.yor.displayError != null) {
            true => 'Please enter valid KEWSA details !',
            _ => null,
          },
        );
      },
    );
  }
}

class _StateWelfareFundInput extends StatelessWidget {
  const _StateWelfareFundInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserCubit, NewUserState>(
      buildWhen: (p, c) => p.stateWelfareFund != c.stateWelfareFund,
      builder: (context, state) {
        return YorAndLabelInput(
          key: Key('memberships_and_licenses_state_welfare_fund_input${state.stateWelfareFund.yor.value}'),
          numberInitialValue: state.stateWelfareFund.number.value,
          numberLabel: 'State Welfare Fund Number',
          yorInitialValue: state.stateWelfareFund.yor.value,
          enabled: true,
          numberChanged: context.read<NewUserCubit>().stateWelfareFundChanged,
          yorChanged: context.read<NewUserCubit>().stateWelfareFundYorChanged,
          error: switch (state.stateWelfareFund.number.displayError != null || state.stateWelfareFund.yor.displayError != null) {
            true => 'State Welfare Fund details is required !',
            _ => null,
          },
        );
      },
    );
  }
}

class _WiremenOrSupervisorInput extends StatelessWidget {
  const _WiremenOrSupervisorInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserCubit, NewUserState>(
      buildWhen: (p, c) => p.wiremenOrsupervisor != c.wiremenOrsupervisor,
      builder: (context, state) {
        return YorAndLabelInput(
          key: Key('memberships_and_licenses_wiremen_or_supervisor_input${state.wiremenOrsupervisor.yor.value}'),
          numberInitialValue: state.wiremenOrsupervisor.number.value,
          numberLabel: 'Wireman/Supervisor Number',
          yorInitialValue: state.wiremenOrsupervisor.yor.value,
          enabled: true,
          numberChanged: context.read<NewUserCubit>().wiremenOrsupervisorChanged,
          yorChanged: context.read<NewUserCubit>().wiremenOrsupervisorYorChanged,
          error: switch (state.wiremenOrsupervisor.number.displayError != null || state.wiremenOrsupervisor.yor.displayError != null) {
            true => 'Wiremen Or Supervisor details is required !',
            _ => null,
          },
        );
      },
    );
  }
}

class _COrbOraOrclassLicenseFundInput extends StatelessWidget {
  const _COrbOraOrclassLicenseFundInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserCubit, NewUserState>(
      buildWhen: (p, c) => p.cOrbOraOrclassLicense != c.cOrbOraOrclassLicense,
      builder: (context, state) {
        return YorAndLabelInput(
          key: Key('memberships_and_licenses_cOrbOraOrclass_license_fund_input${state.cOrbOraOrclassLicense.yor.value}'),
          numberInitialValue: state.cOrbOraOrclassLicense.number.value,
          numberLabel: 'C/B/A Class License Fund Number',
          yorInitialValue: state.cOrbOraOrclassLicense.yor.value,
          enabled: true,
          numberChanged: context.read<NewUserCubit>().cOrbOraOrclassLicenseChanged,
          yorChanged: context.read<NewUserCubit>().cOrbOraOrclassLicenseYorChanged,
          error: switch (state.cOrbOraOrclassLicense.number.displayError != null || state.cOrbOraOrclassLicense.yor.displayError != null) {
            true => 'This field is required !',
            _ => null,
          },
        );
      },
    );
  }
}

class YorAndLabelInput extends StatelessWidget {
  final String numberInitialValue;
  final String numberLabel;
  final String yorInitialValue;
  final String? error;
  final bool enabled;
  final void Function(String) numberChanged;
  final void Function(String) yorChanged;

  const YorAndLabelInput({
    required this.numberInitialValue,
    required this.numberLabel,
    required this.yorInitialValue,
    required this.enabled,
    required this.numberChanged,
    required this.yorChanged,
    required this.error,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              flex: 2,
              child: Input(
                text: numberInitialValue,
                enabled: enabled,
                label: numberLabel,
                onChanged: numberChanged,
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: DateInput(
                label: 'yor',
                text: yorInitialValue,
                onChanged: yorChanged,
              ),
            ),
          ],
        ),
        if (error?.isNotEmpty ?? false)
          Text(
            error!,
            style: const TextStyle(color: AppColors.error),
          ).pOnly(bottom: 8),
        const SizedBox(height: 8),
      ],
    );
  }
}
