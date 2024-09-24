// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kewsa/imports_bindings.dart';
import 'package:kewsa/src/features/dashboard/view/pages/new_user/new_user_page.dart';

class UserDetailsContent extends StatelessWidget {
  const UserDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !context.select((UserDetailsCubit cubit) => cubit.state.isDeleting),
      child: BlocListener<UserDetailsCubit, UserDetailsState>(
        listenWhen: (p, c) => p.error != c.error || p.deletingError != c.deletingError || p.isDeleted != c.isDeleted,
        listener: (context, state) {
          if (state.error != null || state.deletingError != null) {
            ScaffoldMessenger.of(context)
              ..clearSnackBars()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.error ?? state.deletingError ?? 'Something went wrong! Please try again later.'),
                ),
              );
          } else if (state.isDeleted) {
            context.pop();
          }
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('User Details'),
              actions: [
                BlocBuilder<UserDetailsCubit, UserDetailsState>(
                  builder: (context, state) {
                    if (state.user == null) {
                      return const SizedBox.shrink();
                    }
                    return PopupMenuButton(
                      icon: const Icon(Icons.more_vert),
                      onSelected: (value) {
                        switch (value) {
                          case 'Update':
                            final cubit = context.read<HomeCubit>();
                            context.push(NewUserPage.route(state.user, cubit));
                          case 'Delete':
                            final cubit = context.read<UserDetailsCubit>();
                            showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return BlocProvider(
                                  create: (context) => cubit,
                                  child: const DeleteUserDialog(),
                                );
                              },
                            );
                          default:
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem<String>(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          value: 'Update',
                          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: AppColors.dark),
                          child: Text('Update'),
                        ),
                        const PopupMenuItem<String>(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          value: 'Delete',
                          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: AppColors.dark),
                          child: Text('Delete'),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
            body: BlocBuilder<UserDetailsCubit, UserDetailsState>(
              builder: (context, state) {
                if (state.isGettingUser) {
                  return const Loading();
                }

                if (state.error != null) {
                  return ErrorText(state.error);
                }

                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    SizedBox.square(
                      dimension: context.width * .3,
                      child: switch (state.user?.photoUrl?.contains('drive') ?? false) {
                        true => ImageNetwork(
                            'https://drive.google.com/uc?export=view&id=${Uri.parse('${state.user?.photoUrl}').queryParameters['id']}',
                            fit: BoxFit.scaleDown,
                          ),
                        false => FirebaseImage(
                            state.user?.photoUrl,
                            fit: BoxFit.scaleDown,
                          ),
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Personal Details',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 32),
                    ...[
                      (value: state.user?.name, label: 'Name'),
                      (value: state.user?.address, label: 'Address'),
                      (value: state.user?.email, label: 'Email'),
                      (value: state.user?.pincode, label: 'Pincode'),
                      (value: state.user?.phoneNumber, label: 'Phone Number'),
                      (value: state.user?.adhaarNumber, label: 'Adhaar Number'),
                      (value: state.user?.education, label: 'Education'),
                      (value: state.user?.dateOfBirth, label: 'Date Of Birth'),
                      (value: state.user?.bloodGroup, label: 'Blood Group'),
                      (value: state.user?.panchayatOrMunicipality, label: 'Panchayat/Municipality'),
                    ].map(
                      (e) {
                        if (e.value == null) {
                          return const SizedBox.shrink();
                        }
                        return AbsorbPointer(
                          child: Input(
                            text: e.value!,
                            label: e.label,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Nominee Details',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 32),
                    ...[
                      (value: state.user?.nomineeName, label: 'Name'),
                      (value: state.user?.nomineeAdharNumber, label: 'Adhaar'),
                    ].map(
                      (e) {
                        if (e.value == null) {
                          return const SizedBox.shrink();
                        }
                        return AbsorbPointer(
                          child: Input(
                            text: e.value!,
                            label: e.label,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Membership Details',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 32),
                    if (state.user?.unitName != null)
                      AbsorbPointer(
                        child: Input(
                          text: state.user?.unitName ?? '',
                          label: 'Unit Name',
                        ),
                      ),
                    ...[
                      (value: state.user?.governmentPensionNumber, label: 'Gov Pension'),
                      (value: state.user?.kewsaMembershipNumber, label: 'KEWSA Membership'),
                      (value: state.user?.stateWelfareFundNumber, label: 'State Welfare Fund'),
                      (value: state.user?.wiremenOrsupervisorNumber, label: 'Wiremen/Supervisor'),
                      (value: state.user?.cOrbOraOrclassLicenseNumber, label: 'C/B/A Class License'),
                    ].map(
                      (e) {
                        if (e.value?.number?.isEmpty ?? false) {
                          return const SizedBox.shrink();
                        }
                        return AbsorbPointer(
                          child: Row(
                            children: [
                              Flexible(
                                flex: 2,
                                child: Input(
                                  text: e.value?.number ?? '',
                                  label: e.label,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Flexible(
                                child: Input(
                                  text: e.value?.yearOfRenewal ?? '',
                                  label: 'Year Of Renewal',
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
