import 'package:kewsa/imports_bindings.dart';

///
class UnitNamesSheet extends StatefulWidget {
  ///
  const UnitNamesSheet({super.key});

  @override
  State<UnitNamesSheet> createState() => _UnitNamesSheetState();
}

class _UnitNamesSheetState extends State<UnitNamesSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        actions: [
          IconButton.outlined(
            onPressed: context.pop,
            icon: const Icon(
              Icons.close,
            ),
          ).pOnly(right: 8),
        ],
        leading: const SizedBox.shrink(),
        title: const Text('Sor By Unit'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (p, c) => p.isGettingUnitNames != c.isGettingUnitNames || p.unitNames != c.unitNames || p.selUnitNames != c.selUnitNames || p.error != c.error,
        builder: (context, state) {
          if (state.isGettingUnitNames) {
            return const Loading();
          }
          if (state.error?.isNotEmpty ?? false) {
            return ErrorText(state.error);
          }
          if (state.unitNames.isEmpty) {
            return const ErrorText('No unit names available!');
          }
          return ListView(
            children: [
              for (final unitName in state.unitNames)
                InkWell(
                  onTap: () => context.read<HomeCubit>().updateSelUnitNames(
                        unitName,
                        isSelected: state.selUnitNames.contains(unitName),
                      ),
                  child: Row(
                    children: [
                      Icon(
                        switch (state.selUnitNames.contains(unitName)) {
                          true => Icons.radio_button_checked,
                          false => Icons.radio_button_off_outlined,
                        },
                      ),
                      Text(
                        unitName.unitName ?? '',
                        style: const TextStyle(
                          color: AppColors.dark,
                        ),
                      ).pxy(x: 8),
                    ],
                  ).pad(8),
                ),
            ],
          );
        },
      ),
      bottomNavigationBar: ElevatedButton(
        style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
        onPressed: () {},
        child: Text(
          'Apply',
          style: AppStyles.text16Px,
        ),
      ).pad(16),
    );
  }
}
