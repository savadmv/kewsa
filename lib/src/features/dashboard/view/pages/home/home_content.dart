import 'package:kewsa/imports_bindings.dart';
import 'package:kewsa/src/features/dashboard/view/pages/user_details/user_details_page.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (p, c) => p.isGettingUsers != c.isGettingUsers || p.users != c.users || p.selUnitNames != c.selUnitNames,
      builder: (context, state) {
        if (state.isGettingUsers) {
          return const Loading();
        }

        if (state.error != null) {
          return ErrorText(state.error);
        }

        if (state.users.isEmpty) {
          return const ErrorText("Couldn't find users !");
        }

        final selUnitNames = [...state.selUnitNames.map((e) => e.unitName?.toLowerCase())];

        final filteredUsers = state.selUnitNames.isEmpty ? state.users : state.users.where((e) => selUnitNames.contains(e.unitName?.toLowerCase()));

        if (filteredUsers.isEmpty) {
          return const ErrorText("Couldn't find users ! Please clear filters");
        }

        return ListView(
          padding: const EdgeInsets.all(4),
          children: [
            if (state.selUnitNames.isNotEmpty)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final unit in state.selUnitNames)
                      Chip(
                        shape: const StadiumBorder(),
                        backgroundColor: AppColors.dark,
                        labelStyle: const TextStyle(color: AppColors.light),
                        deleteIconColor: AppColors.light,
                        label: Text(unit.unitName ?? ''),
                        onDeleted: () {
                          context.read<HomeCubit>().updateSelUnitNames(unit, isSelected: true);
                        },
                      ).pOnly(right: 8),
                  ],
                ).pOnly(bottom: 16),
              ),
            for (final e in filteredUsers) _UserTile(user: e),
          ],
        );
      },
    );
  }
}

class _UserTile extends StatelessWidget {
  const _UserTile({
    required this.user,
  });

  final UserEntity? user;

  @override
  Widget build(BuildContext context) {
    return ShadowCard(
      contentPadding: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        hoverColor: AppColors.lightPrimary.withOpacity(.1),
        highlightColor: AppColors.lightPrimary.withOpacity(.15),
        onTap: () {
          // if (advertisement?.id != null) {
          //   context.push(AdvertisementDetailsPage.route(advertisement!.id));
          // }
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: InkWell(
            onTap: () {
              if (user?.id != null) {
                context.push(UserDetailsPage.route(id: user!.id!));
              }
            },
            child: Row(
              children: [
                SizedBox.square(
                  dimension: 50,
                  child: switch (user?.photoUrl?.contains('drive') ?? false) {
                    true => ImageNetwork(
                        'https://drive.google.com/uc?export=view&id=${Uri.parse('${user?.photoUrl}').queryParameters['id']}',
                        fit: BoxFit.scaleDown,
                      ),
                    false => FirebaseImage(
                        user?.photoUrl,
                        fit: BoxFit.scaleDown,
                      ),
                  },
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        user?.name ?? '',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.dark),
                      ),
                      Text(
                        user?.email ?? '',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.dark),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ).pOnly(bottom: 16);
  }
}
