// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kewsa/imports_bindings.dart';

class PersonalDetailsStepper extends StatelessWidget {
  const PersonalDetailsStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _NameInput(),
          _EmailInput(),
          _PhoneInput(),
          _AdhaarInput(),
          _EducationInput(),
          _ShortInputs(),
          _PanchayatOrMunicipalityInput(),
          _PincodeInput(),
          _AddressInput(),
        ],
      ),
    );
  }
}

class _ShortInputs extends StatelessWidget {
  const _ShortInputs();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Flexible(
              child: _DobInput(),
            ),
            SizedBox(width: 16),
            Flexible(
              child: _BloodGroupInput(),
            ),
          ],
        ),
        BlocBuilder<NewUserCubit, NewUserState>(
          builder: (context, state) {
            String? error;
            if (state.bloodGroup.displayError != null) {
              error = 'Enter valid Blood Group';
            } else if (state.dateOfBirth.displayError != null) {
              error = 'Enter valid Date of birth';
            }
            if (error != null) {
              return Text(
                error,
                style: const TextStyle(color: AppColors.error),
              ).pOnly(bottom: 16);
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}

class _NameInput extends StatelessWidget {
  const _NameInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserCubit, NewUserState>(
      buildWhen: (p, c) => p.name != c.name,
      builder: (context, state) {
        return Input(
          text: state.name.value,
          enabled: !state.isSaving,
          label: 'Name',
          keyboardType: TextInputType.name,
          errorText: switch (state.name.displayError) {
            FormTextError.empty => 'Please enter name !',
            _ => null,
          },
          onChanged: context.read<NewUserCubit>().nameChanged,
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserCubit, NewUserState>(
      buildWhen: (p, c) => p.email != c.email,
      builder: (context, state) {
        return Input(
          text: state.email.value,
          enabled: !state.isSaving,
          label: 'Email',
          keyboardType: TextInputType.emailAddress,
          errorText: switch (state.email.displayError) {
            EmailValidationError.invalid => 'Please enter valid email !',
            _ => null,
          },
          onChanged: context.read<NewUserCubit>().emailChanged,
        );
      },
    );
  }
}

class _AddressInput extends StatelessWidget {
  const _AddressInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserCubit, NewUserState>(
      buildWhen: (p, c) => p.address != c.address,
      builder: (context, state) {
        return Input(
          text: state.address.value,
          enabled: !state.isSaving,
          label: 'Address',
          keyboardType: TextInputType.streetAddress,
          errorText: switch (state.address.displayError) {
            FormTextError.empty => 'Please enter valid address !',
            _ => null,
          },
          onChanged: context.read<NewUserCubit>().addressChanged,
        );
      },
    );
  }
}

class _PincodeInput extends StatelessWidget {
  const _PincodeInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserCubit, NewUserState>(
      buildWhen: (p, c) => p.pincode != c.pincode,
      builder: (context, state) {
        return Input(
          text: state.pincode.value,
          enabled: !state.isSaving,
          label: 'Pincode',
          keyboardType: TextInputType.number,
          limit: 6,
          errorText: switch (state.pincode.displayError) {
            PincodeError.empty => 'Please enter valid pincode !',
            PincodeError.length => 'Pincode should be 6 length !',
            _ => null,
          },
          onChanged: context.read<NewUserCubit>().picodeChanged,
        );
      },
    );
  }
}

class _PhoneInput extends StatelessWidget {
  const _PhoneInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserCubit, NewUserState>(
      buildWhen: (p, c) => p.phone != c.phone,
      builder: (context, state) {
        return Input(
          text: state.phone.value,
          enabled: !state.isSaving,
          label: 'Phone',
          keyboardType: TextInputType.number,
          limit: 10,
          prefixIcon: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '+91',
                  style: TextStyle(fontSize: 18),
                ).pOnly(left: 16, right: 8),
                const VerticalDivider(),
              ],
            ),
          ).pxy(y: 16),
          errorText: switch (state.phone.displayError) {
            PhoneError.empty => 'Please enter valid phone number !',
            PhoneError.length => 'Phone number should be 10 length !',
            _ => null,
          },
          onChanged: context.read<NewUserCubit>().phoneChanged,
        );
      },
    );
  }
}

class _AdhaarInput extends StatelessWidget {
  const _AdhaarInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserCubit, NewUserState>(
      buildWhen: (p, c) => p.adhaar != c.adhaar,
      builder: (context, state) {
        return Input(
          text: state.adhaar.value,
          enabled: !state.isSaving,
          label: 'Adhaar',
          keyboardType: TextInputType.number,
          limit: 16,
          errorText: switch (state.adhaar.displayError) {
            AdhaarError.empty => 'Please enter valid phone number !',
            AdhaarError.length => 'Adhaar Number should be 16 length !',
            _ => null,
          },
          onChanged: context.read<NewUserCubit>().adhaarChanged,
        );
      },
    );
  }
}

class _EducationInput extends StatelessWidget {
  const _EducationInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserCubit, NewUserState>(
      buildWhen: (p, c) => p.education != c.education,
      builder: (context, state) {
        return Input(
          text: state.education.value,
          enabled: !state.isSaving,
          label: 'Education',
          keyboardType: TextInputType.text,
          errorText: switch (state.education.displayError) {
            FormTextError.empty => 'Please enter valid education !',
            _ => null,
          },
          onChanged: context.read<NewUserCubit>().educationChanged,
        );
      },
    );
  }
}

class _DobInput extends StatelessWidget {
  const _DobInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserCubit, NewUserState>(
      buildWhen: (p, c) => p.dateOfBirth != c.dateOfBirth,
      builder: (context, state) {
        return DateInput(
          key: Key('personal_details_stepper_dob_input${state.dateOfBirth.value}'),
          label: 'Date of birth',
          text: state.dateOfBirth.value,
          onChanged: (e) => context.read<NewUserCubit>().dateOfBirthChanged(e),
        );
      },
    );
  }
}

class _BloodGroupInput extends StatelessWidget {
  const _BloodGroupInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserCubit, NewUserState>(
      buildWhen: (p, c) => p.bloodGroup != c.bloodGroup,
      builder: (context, state) {
        return Input(
          text: state.bloodGroup.value,
          enabled: !state.isSaving,
          label: 'Blood Group',
          onChanged: context.read<NewUserCubit>().bloodGroupChanged,
        );
      },
    );
  }
}

class _PanchayatOrMunicipalityInput extends StatelessWidget {
  const _PanchayatOrMunicipalityInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserCubit, NewUserState>(
      buildWhen: (p, c) => p.panchayatOrMunicipality != c.panchayatOrMunicipality,
      builder: (context, state) {
        return Input(
          text: state.panchayatOrMunicipality.value,
          enabled: !state.isSaving,
          label: 'Panchayath/Municipality',
          errorText: switch (state.panchayatOrMunicipality.displayError) {
            FormTextError.empty => 'Please enter Panchayath/Municipality !',
            _ => null,
          },
          onChanged: context.read<NewUserCubit>().panchayatOrMunicipalityChanged,
        );
      },
    );
  }
}

class Input extends StatelessWidget {
  final String label;

  final String text;

  final void Function(String)? onChanged;

  final bool? enabled;

  final String? errorText;

  final TextInputType? keyboardType;

  final Widget? prefixIcon;

  final int? limit;

  const Input({
    required this.text,
    super.key,
    this.label = '',
    this.onChanged,
    this.enabled,
    this.errorText,
    this.keyboardType,
    this.prefixIcon,
    this.limit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          enabled: enabled,
          initialValue: text,
          onChanged: onChanged,
          keyboardType: keyboardType ?? TextInputType.text,
          style: AppStyles.text16Px,
          inputFormatters: <TextInputFormatter>[
            if ([TextInputType.phone, TextInputType.number].contains(keyboardType)) FilteringTextInputFormatter.digitsOnly,
            if (limit != null) LengthLimitingTextInputFormatter(limit),
          ],
          decoration: InputDecoration(
            labelText: label,
            contentPadding: const EdgeInsets.all(8),
            prefixIcon: prefixIcon,
          ),
        ).pOnly(bottom: 4),
        if (errorText?.isNotEmpty ?? false)
          Text(
            errorText!,
            style: const TextStyle(color: AppColors.error),
          ).pOnly(bottom: 8),
        const SizedBox(height: 8),
      ],
    );
  }
}

class DateInput extends StatelessWidget {
  final String label;

  final String text;

  final void Function(String) onChanged;

  const DateInput({
    required this.label,
    required this.text,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDatePicker(
          context: context,
          firstDate: DateTime.now().subtract(const Duration(days: 365000)),
          lastDate: DateTime.now(),
        ).then(
          (value) {
            if (value != null) {
              onChanged.call(value.ddMMYYYY);
            }
          },
        );
      },
      child: AbsorbPointer(
        child: Input(
          text: text,
          enabled: true,
          label: label,
        ),
      ),
    );
  }
}
